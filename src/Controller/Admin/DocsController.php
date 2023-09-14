<?php

declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\AppController;
use Cake\Event\EventInterface;

class DocsController extends AppController
{


    public function index()
    {

        if ($this->request->is('post')) {

            $this->autoRender = false;

            $conditions = [];

            // Filters and Search
            $_from = !empty($_GET['from']) ? $_GET['from'] : '';
            $_to = !empty($_GET['to']) ? $_GET['to'] : '';

            $_method = !empty($_GET['method']) ? $_GET['method'] : '';
            $_col = !empty($_GET['col']) ? $_GET['col'] : 'id';
            $_k = (isset($_GET['k']) && strlen($_GET['k']) > 0) ? $_GET['k'] : false;
            $_dir = !empty($_GET['direction']) ? $_GET['direction'] : 'DESC';


            if (!empty($_from)) {
                $conditions['Docs.stat_created > '] = $_from;
            }
            if (!empty($_to)) {
                $conditions['Docs.stat_created < '] = $_to;
            }
            if ($_k !== false) {
                $_method == 'like' ?  $conditions[$_col . ' LIKE '] = '%' . $_k . '%' : $conditions['Docs.' . $_col] = $_k;
            }

            $data = [];
            $_id = $this->request->getQuery('id');
            $_list = $this->request->getQuery('list');
            $_selectList = $this->request->getQuery('selectList');

            // ONE RECORD
            if (!empty($_id)) {
                $data = $this->Docs->get($_id)->toArray();
                $data = $this->Do->convertJson($data);
                // dd($data);
                echo json_encode(
                    ["status" => "SUCCESS",  "data" => $data],
                    JSON_UNESCAPED_UNICODE
                );
                die();
            }

            // LIST
            if (!empty($_list)) {
                $data = $this->paginate($this->Docs, [
                    "order" => [$_col => $_dir],
                    "contain" => ["Histories"],
                    "conditions" => $conditions,
                ]);
                $data = $this->Do->convertJson($data);
            }

            // Select LIST
            if (!empty($_selectList)) {
                $data = $this->Docs->find('list');
                echo json_encode(
                    ["status" => "SUCCESS",  "data" => [], "Docs_list" => $data],
                    JSON_UNESCAPED_UNICODE
                );
                die();
            }

            echo json_encode(
                ["status" => "SUCCESS",  "data" => $data, "paging" => $this->Paginator->getPagingParams()["Docs"]],
                JSON_UNESCAPED_UNICODE
            );
            die();
        }
    }

    public function view($id = null)
    {
        $rec = $this->Docs->get($id);
        $this->set(compact('rec'));
    }

    public function save($id = -1)
    {

        $dt = json_decode(file_get_contents('php://input'), true);
        $ctrl = $this->request->getParam('controller');

        // edit mode
        if ($this->request->is(['patch', 'put'])) {
            $rec = $this->Docs->get($dt['id']);
            $doc_allowed_roles = array_flip(explode(',', $rec->doc_allowed_roles));
            $doc_allowed_roles = array_map(function ($element) {
                return 1;
            }, $doc_allowed_roles);
            $rec->doc_allowed_roles = json_encode($doc_allowed_roles);
            //dd($rec);
        }

        // add mode
        if ($this->request->is(['post'])) {
            $rec = $this->Docs->newEmptyEntity();
            $dt['id'] = null;
            $dt['user_id'] = $this->authUser['id'];
            $dt['stat_created'] = date('Y-m-d H:i:s');
        }

        if ($this->request->is(['post', 'patch', 'put'])) {

            $this->autoRender  = false;
            // docs_allowed_roles
            $keys = array_keys($dt['doc_allowed_roles']);
            $roles = implode(',', $keys);
            $dt['doc_allowed_roles'] = $roles;

            // $fname = strtolower(preg_replace('/[^a-zA-Z0-9_]/', "_", $dt['file'][0]['name']));
            if (isset($dt['file'][0]['name'])) {
                $fname = strtolower(preg_replace('/[^a-zA-Z0-9_]/', "_", $dt['file'][0]['name']));
            } else {
            }

            if (!empty($dt['file'])) {
                $this->Images->uploader(
                    'file/' . $dt['tar_tbl_name'] . '_files',
                    $dt['file'][0],
                    str_replace('.', '_', $fname),
                    [],
                    0,
                    false
                );

                $dt['doc_name'] = $this->Images->getPhotosNames();
            } else {
                unset($dt['doc_name']);
            }


            $rec = $this->Docs->patchEntity($rec, $dt);
            // dd($rec);
            if ($newRec = $this->Docs->save($rec)) {
                // check if the this doc in the add mode
                if ($newRec->tar_id == 0 && $newRec->tar_tbl == 2) {
                    $latestExpensesId = $this->getTableLocator()->get('Expenses')
                        ->find()
                        ->order(['id' => 'DESC'])
                        ->first()->id;
                    $newRec->tar_id = $latestExpensesId;
                } elseif ($newRec->tar_id == 0 && $newRec->tar_tbl == 1) {
                    $latestServiceId = $this->getTableLocator()->get('Services')
                        ->find()
                        ->order(['id' => 'DESC'])
                        ->first()->id;
                    $newRec->tar_id = $latestServiceId;
                }
                $this->Docs->save($newRec);
                echo json_encode(["status" => "SUCCESS", "data" => $newRec]);
                die();

                echo json_encode(["status" => "FAIL", "data" => $rec->getErrors()]);
                die();
            }
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
            $rec = $this->Docs->get($rec_id);
            $delRec[$k] = $this->Docs->delete($rec);
            $this->Images->deleteFile('file/' . ($rec->tar_tbl == 1 ? 'properties' : 'projects') . '_files', $rec->doc_name);
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
            $rec = $this->Docs->newEmptyEntity();
            $rec['id'] = $id;
            $rec['rec_state'] = $val;
            $updateRec[$k] = $this->Docs->save($rec);
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
