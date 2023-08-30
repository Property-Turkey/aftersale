<?php

declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\AppController;


class ServicesController extends AppController
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
                $conditions['Services.stat_created > '] = $_from;
            }
            if (!empty($_to)) {
                $conditions['Services.stat_created < '] = $_to;
            }
            if ($_k !== false) {
                $_method == 'like' ?  $conditions['Services.'.$_col . ' LIKE '] = '%' . $_k . '%' : $conditions['Services.' . $_col] = $_k;
            }
            $data = [];
            $_id = $this->request->getQuery('id');
            $_list = $this->request->getQuery('list');

            // ONE RECORD
            if (!empty($_id)) {
                $data = $this->Services->get($_id, [
                    'contain' => [
                        'Users' => ['fields' => ['user_fullname']],
                        'Tenant' => ['fields' => ['user_fullname']],
                        'Owner' => ['fields' => ['user_fullname']],
                        'Packages' => ['fields' => ['package_name']],
                        'Properties' => ['fields' => ['Properties.property_ref']],
                    ]
                ])->toArray();

                $data = $this->Do->convertJson($data);
                echo json_encode(
                    ["status" => "SUCCESS",  "data" => $this->Do->convertJson($data)],
                    JSON_UNESCAPED_UNICODE
                );
                die();
            }

            // LIST
            if (!empty($_list)) {

                $data = $this->Services->find('all',  [
                    "order" => ['Services.'.$_col => $_dir],
                    "conditions" => $conditions,
                    "contain" => [
                        "Users" => ["fields" => ["Users.user_fullname"]],
                        'Tenant' => ['fields' => ['Tenant.user_fullname']],
                        'Owner' => ['fields' => ['Owner.user_fullname']],
                        'Packages' => ['fields' => ['Packages.package_name']],
                        'Properties' => ['fields' => ['Properties.property_ref', 'Properties.id']],
                    ]
                ]);
                $data = $this->Do->convertJson( $this->paginate( $data ) );
                dd($data);
            }
            // //expiration date 
            // foreach ($data as &$service) {
            //     $service['expiration_date'] = date('Y-m-d H:i:s', strtotime($service['stat_created'] . ' + ' . $service['service_contract_period'] . ' days'));
            // }
            echo json_encode(
                ["status" => "SUCCESS",  "data" => $data, "paging" => $this->request->getAttribute('paging')],
                JSON_UNESCAPED_UNICODE
            );
            die();
        }

        $tenants = $this->Services->Users->find('list', [
            'conditions' => ['user_role' => 'user.tenant']
        ]);
        $owners = $this->Services->Users->find('list', [
            'conditions' => ['user_role' => 'user.owner']
        ]);

        $packages = $this->getTableLocator()->get('Packages')->find('list')->toArray();

        $this->set(compact('tenants', 'owners', 'packages'));
    }

    public function save($id = -1)
    {
        if ($this->request->is(['post', 'put', 'patch'])) {

            $this->autoRender  = false;
            $dt = json_decode(file_get_contents('php://input'), true);

            if ($this->request->is(['patch', 'put'])) {
                $rec = $this->Services->get($dt['id']);
            }
            // Add new record
            if ($this->request->is(['post'])) {
                $dt['id'] = null;
                $dt['user_id'] = $this->authUser['id'];

                $rec = $this->Services->newEntity($dt);
            }
            $rec = $this->Services->patchEntity($rec, $dt);

            if ($newRec = $this->Services->save($rec)) {
                echo json_encode(["status" => "SUCCESS", "data" => $newRec]);
                die();
            }
            echo json_encode(["status" => "FAIL", "data" => $newRec->getErrors()]);
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
        $delRec = $this->Services->deleteAll(['id IN ' => explode(",", $id)]);

        if ($delRec) {
            $res = ["status" => "SUCCESS", "data" => $delRec];
        } else {
            $res = ["status" => "FAIL", "data" => $delRec->getErrors()];
        }
        echo json_encode($res);
        die();

        return $this->redirect(['action' => 'index']);
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
        $records = json_decode(file_get_contents('php://input'), true);
        $errors = [];
        foreach ($records as $rec) {
            if (!is_numeric($rec)) {
                continue;
            }
            $dt = $this->Services->newEmptyEntity();;
            $dt["id"] = $rec;
            $dt["rec_state"] = $val;
            if (!$this->Services->save($dt)) {
                $errors[] = $dt->getErrors();
            }
        }

        if (empty($errors)) {
            $res = ["status" => "SUCCESS", "data" => $dt];
        } else {
            $res = ["status" => "FAIL", "data" => $dt->getErrors()];
        }
        echo json_encode($res);
        die();
    }
}
