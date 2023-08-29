<?php

declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\AppController;
use Cake\Event\EventInterface;

class MessagesController extends AppController
{
    public function index($queryParams = null)
    {
        $dt = $this->request->getQuery();
        $conditions = [];

        if ($queryParams) {
            $_GET = $queryParams;
        }

        // Filters and Search
        $_from = !empty($_GET['from']) ? $_GET['from'] : '';
        $_to = !empty($_GET['to']) ? $_GET['to'] : '';

        $_method = !empty($_GET['method']) ? $_GET['method'] : '';
        $_col = !empty($_GET['col']) ? $_GET['col'] : 'id';
        $_k = (isset($_GET['k']) && strlen($_GET['k']) > 0) ? $_GET['k'] : false;
        $_dir = !empty($_GET['direction']) ? $_GET['direction'] : 'DESC';


        $_id = isset($_GET['id']) ? $_GET['id']  : $this->request->getQuery('id');
        $_list = isset($_GET['list']) ? $_GET['list']  : $this->request->getQuery('list');

        if (!empty($_from)) {
            $conditions['Messages.stat_created > '] = $_from;
        }
        if (!empty($_to)) {
            $conditions['Messages.stat_created < '] = $_to;
        }
        if ($_k !== false) {
            $_method == 'like' ?  $conditions[$_col . ' LIKE '] = '%' . $_k . '%' : $conditions['Messages.' . $_col] = $_k;
        }

        $data = [];

        if ($this->request->is(['post'])) {
            $this->autoRender = false;
            // LIST
            if (isset($dt['list'])) {
                // OUTGOING MESSAGES
                if ($dt['list'] == 'out') {
                    $conditions['Messages.parent_id'] = 0;
                    $conditions['Messages.user_id'] = $this->authUser['id'];
                    $data = $this->Messages->find('all', [
                        "conditions" => $conditions,
                        "contain" => ["Users" => ["fields" => ["Users.user_fullname"]]]
                    ]);
                    // INCOMING MESSAGES
                } elseif ($dt['list'] == 'in') {
                    $data = [];
                    $conditions['UserMessage.user_id'] = $this->authUser['id'];
                    $userMessages = $this->Messages->UserMessage->find('all', [
                        "conditions" => $conditions,
                        "contain" => [
                            "Messages.Users" => ["fields" => ["Users.user_fullname", "Messages.rec_state", "Messages.message_subject"]]
                        ]
                    ]);
                    // debug($userMessages->toArray());die();
                    foreach ($userMessages->toArray() as &$msg) {
                        $msg->message->isNew = $msg->rec_state;
                        $msg->message->user = ['user_fullname' => $msg->message->user->user_fullname];
                        $data[] = $msg->message;
                    }
                } else {
                    $data = $this->Messages->find('all', [
                        "order" => ['Messages.' . $_col => $_dir],
                        "conditions" => $conditions,
                        "contain" => ["Users" => ["fields" => ["Users.user_fullname"]]]
                    ]);
                }
            }
            // ONE RECORD
            if (!empty($dt['id'])) {
                $data = $this->Messages->get($dt['id'], [
                    "contain" => [
                        "UserMessage" => [
                            "conditions" => ["UserMessage.user_id" => $this->authUser['id'], "UserMessage.message_id" => $dt['id']]
                        ],
                        "Users" => ["fields" => ["Users.id", "Users.user_fullname", "Users.user_role"]],
                        "ChildMessages.Users" => ["fields" => ["Users.id", "Users.user_fullname", "Users.user_role"]]
                    ]
                ]);
                // Update sent user_message status from new to read
                if (count($data->user_message) > 0) {
                    $dt_arr = $data->user_message[0]->toArray();
                    if ($dt_arr['rec_state'] == 1) {
                        $this->Do->adder(['id' => $dt_arr['id'], 'rec_state' => 2], 'UserMessage');
                    }
                }
                // Update message owner status from new to read
                if ($data->rec_state == 1 && $data->user_id == $this->authUser['id']) {
                    $this->Do->adder(['id' => $data->id, 'rec_state' => 2], 'Messages');
                }
            }
            $response = ["status" => "SUCCESS",  "data" => $data];
            echo json_encode($response, JSON_UNESCAPED_UNICODE);
            die();
        }
    }

    public function search()
    {
        $dt = json_decode(file_get_contents('php://input'), true);
        $params =

            ['list' => 1, 'col' => $dt['col'], 'direction' => $dt['direction']];
        return $this->index($params);
    }

    public function save($id = -1)
    {
        $this->request->allowMethod(['post', 'put', 'patch']);
        $this->autoRender  = false;

        if ($this->request->is(['patch', 'put', 'post'])) {

            $dt = json_decode(file_get_contents('php://input'), true);

            // UPDATE
            if ($id > -1) {
                $message = $this->Messages->get($id);
                // NEW INSERT
            } else {
                $message = $this->Messages->newEmptyEntity();
                $dt["user_id"] = $this->authUser["id"];
                $dt["user_message"] = [];
                if (!empty($dt["message_text"])) {
                    $dt["message_subject"] = empty($dt["message_subject"]) ?
                        strip_tags(substr($dt["message_text"], 0, 30)) : $dt["message_subject"];
                }
                $ids = [];
                // change parent message status to new
                if (!empty($dt['parent_id'])) {
                    $this->Do->adder(['id' => $dt['parent_id'], 'rec_state' => 1], 'Messages');
                }
                // extract ids for office and users
                if (!empty($dt['selectedUsers'])) {
                    foreach ($dt['selectedUsers'] as $k => $v) {
                        if ($k === false ||  $v === null || !$v[key($v)] || in_array(key($v), $ids)  || $this->authUser['id'] == key($v)) {
                            continue;
                        }
                        $ids[] = 'u' . key($v);
                        $dt["user_message"][] = [
                            'office_id' => $this->authUser['office_id'],
                            'user_id' => key($v),
                        ];
                    }
                }
                if (!empty($dt['office_id'])) {
                    $ids[] = 'r' . $dt['office_id'];
                }
                if (count($ids) > 0) {
                    $dt['message_to'] = ',' . implode(',', $ids) . ',';
                }
            }
            // prevent sent message to user himself only in case send new message not reply
            if (empty($dt['message_to']) && empty($dt['parent_id'])) {
                echo json_encode(["status" => "FAIL", "data" => [], 'msg' => __('must_select_user')]);
                die();
            }
            $message = $this->Messages->patchEntity($message, $dt, ['associated' => ['UserMessage']]);

            if ($newRec = $this->Messages->save($message, ['associated' => ['UserMessage']])) {
                echo json_encode(["status" => "SUCCESS", "data" => $newRec]);
                die();
            }
            echo json_encode(["status" => "FAIL", "data" => $message->getErrors()]);
            die();
        }
    }

    public function delete($id = null)
    {
        if (!$id) {
            echo json_encode(["status" => "FAIL", "msg" => __("is-selected-empty-msg"), "data" => []]);
            die();
        }
        $this->request->allowMethod(['post', 'delete']);
        $this->autoRender  = false;

        if (!$this->_isAuthorized(true)) {
            echo json_encode(["status" => "FAIL", "msg" => __("no-auth"), "data" => []]);
            die();
        }

        $delRec = [];
        foreach (explode(",", $id) as $k => $rec_id) {
            $rec = $this->Messages->get($rec_id);
            $delRec[$k] = $this->Messages->delete($rec);
        }

        $res = (!empty(array_filter($delRec))) ? ["status" => "SUCCESS", "data" => $delRec] : ["status" => "FAIL", "data" => $delRec];

        echo json_encode($res);
        die();
    }

    public function enable($val = 1, $ids = null)
    {
        if (!$ids) {
            echo json_encode(["status" => "FAIL", "msg" => __("is-selected-empty-msg"), "data" => []]);
            die();
        }
        $this->request->allowMethod(['post', 'delete']);
        $this->autoRender  = false;

        if (!$this->_isAuthorized(true)) {
            echo json_encode(["status" => "FAIL", "msg" => __("no-auth"), "data" => []]);
            die();
        }

        $updateRec = [];
        foreach (explode(',', $ids) as $k => $id) {
            $rec = $this->Messages->newEmptyEntity();
            $rec['id'] = $id;
            $rec['rec_state'] = $val;
            $updateRec[$k] = $this->Messages->save($rec);
        }

        $res = (!empty(array_filter($updateRec))) ? ["status" => "SUCCESS", "data" => $updateRec] : ["status" => "FAIL", "data" => $updateRec];

        echo json_encode($res);
        die();
    }

    function beforeFilter(EventInterface $event)
    {
        parent::beforeFilter($event);

        if ($this->request->is(['post', 'patch', 'put', 'delete'])) {
            if (!$this->_isAuthorized(true, 'read')) {
                echo json_encode(["status" => "FAIL", "redirect" => $this->app_folder . '/?login=1']);
                die();
            }
        }
    }
}
