<?php

declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\AppController;

class PackagesController extends AppController
{

    public function index( )
    {

        if ($this->request->is('post')) {

            $this->autoRender = false;

            $conditions = [ ];

            // Filters and Search
            $_from = !empty($_GET['from']) ? $_GET['from'] : '';
            $_to = !empty($_GET['to']) ? $_GET['to'] : '';

            $_method = !empty($_GET['method']) ? $_GET['method'] : '';
            $_col = !empty($_GET['col']) ? $_GET['col'] : 'id';
            $_k = (isset($_GET['k']) && strlen($_GET['k'])>0) ? $_GET['k'] : false;
            $_dir = !empty($_GET['direction']) ? $_GET['direction'] : 'DESC';
    
            
            if( !empty($_from) ){ $conditions['Packages.stat_updated > '] = $_from; }
            if( !empty($_to) ){ $conditions['Packages.stat_updated < '] = $_to; }
            if($_k !== false){
                $_method == 'like' ?  $conditions[$_col.' LIKE '] = '%'.$_k.'%' : $conditions['Packages.'.$_col] = $_k;
            }
            
            $data=[];
            $_id = $this->request->getQuery('id');
            $_list = $this->request->getQuery('list');

            // ONE RECORD
            if(!empty($_id)){
                $data = $this->Packages->get( $_id )->toArray();
                $data = $this->Do->convertJson($data);
                echo json_encode( [ "status"=>"SUCCESS",  "data"=>$data],  JSON_UNESCAPED_UNICODE); die();
            }

            // LIST
            if(!empty($_list)){ 
                $data = $this->paginate($this->Packages, [
                    "order"=>[ $_col => $_dir ],
                    "conditions"=>$conditions,
                ]);
                $data = $this->Do->convertJson($data);
            }

            echo json_encode( 
                [ "status"=>"SUCCESS",  "data"=>$data, "paging"=>$this->request->getAttribute('paging') ], 
                JSON_UNESCAPED_UNICODE); die();
        }
        $packagename = $this->getTableLocator()->get('Packages')->find('list', ['keyField' => 'id', 'valueField' => 'package_name']);
        $this->set(compact('packagename'));
     }
    
    public function view($id = null)
    {
        $rec = $this->Packages->get($id, [
            'contain' => [],
        ]);

        $this->set('rec', $rec);
    }

    public function save($id = -1)
    {
        $this->request->allowMethod(['post', 'put', 'patch']);

        $this->autoRender  = false;
        $dt = json_decode(file_get_contents('php://input'), true);

        if ($this->request->is(['patch', 'put'])) {
            $rec = $this->Packages->get($dt['id']);
        }
        //add new record
        if ($this->request->is(['post'])) {
            $rec = $this->Packages->newEmptyEntity();
            $dt['id'] = null;
        }

        $rec = $this->Packages->patchEntity($rec, $dt);

        if ($newRec = $this->Packages->save($rec)) {
            echo json_encode(["status" => "SUCCESS", "data" => $newRec]);
            die();
        }
        echo json_encode(["status" => "FAIL", "data" => $rec->getErrors()]);
        die();
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
        $delRec = $this->Packages->deleteAll(['id IN ' => explode(",", $id)]);

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
            $dt = $this->Packages->newEmptyEntity();;
            $dt["id"] = $rec;
            $dt["rec_state"] = $val;
            if (!$this->Packages->save($dt)) {
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
