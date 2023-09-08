<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\AppController;

class BanksController extends AppController
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
    
            
            if( !empty($_from) ){ $conditions['Banks.stat_updated > '] = $_from; }
            if( !empty($_to) ){ $conditions['Banks.stat_updated < '] = $_to; }
            if($_k !== false){
                $_method == 'like' ?  $conditions[$_col.' LIKE '] = '%'.$_k.'%' : $conditions['Banks.'.$_col] = $_k;
            }
            
            $data=[];
            $_id = $this->request->getQuery('id');
            $_list = $this->request->getQuery('list');

            // ONE RECORD
            if(!empty($_id)){
                $data = $this->Banks->get( $_id )->toArray();
                $data = $this->Do->convertJson($data);
                echo json_encode( [ "status"=>"SUCCESS",  "data"=>$data],  JSON_UNESCAPED_UNICODE); die();
            }

            // LIST
            if(!empty($_list)){ 
                $data = $this->paginate($this->Banks, [
                    "order"=>[ $_col => $_dir ],
                    "conditions"=>$conditions,
                ]);
                $data = $this->Do->convertJson($data);
            }

            echo json_encode( 
                [ "status"=>"SUCCESS",  "data"=>$data, "paging"=>$this->request->getAttribute('paging') ], 
                JSON_UNESCAPED_UNICODE); die();
        }
    }
    public function view($id = null)
    {
        $rec = $this->Banks->get($id, [
            'contain' => [],
        ]);

        $this->set('rec', $rec);
    }
    
   
    public function save($id = -1) 
    {
        $this->request->allowMethod(['post', 'put', 'patch']);
        
        $this->autoRender  = false;
        $dt = json_decode( file_get_contents('php://input'), true);

        if ($this->request->is(['patch', 'put'])) {
            $rec = $this->Banks->get($dt['id']);
        }
       //add new record
       if ($this->request->is(['post'])) {
        $dt['id'] = null;
        $dt['user_id'] = $this->authUser['id'];
        $rec = $this->Banks->newEntity($dt);
    }
        
        $rec = $this->Banks->patchEntity($rec, $dt);
		
        if ($newRec = $this->Banks->save($rec)) {
            echo json_encode(["status"=>"SUCCESS", "data"=>$newRec]); die();
        }
        echo json_encode(["status"=>"FAIL", "data"=>$rec->getErrors()]); die();
    }
    
	
    public function delete($id = null)
    {
        if(!$id){
            echo json_encode( ["status"=>"FAIL", "msg"=>__("is-selected-empty-msg"), "data"=>[]] ); die();
        }
        $this->request->allowMethod(['post', 'delete']);
        $this->autoRender  = false;

        if(!$this->_isAuthorized(true)){
            echo json_encode( ["status"=>"FAIL", "msg"=>__("no-auth"), "data"=>[]] ); die();
        }
        $delRec = $this->Banks->deleteAll(['id IN ' => explode(",", $id)]);
        
        if ($delRec) {
            $res = ["status"=>"SUCCESS", "data"=>$delRec];
        }else{
            $res = ["status"=>"FAIL", "data"=>$delRec->getErrors()];
        }
        echo json_encode($res);die();

        return $this->redirect(['action' => 'index']);
    }
    
    public function enable($val=1, $ids=null)
    {
        if(!$ids){
            echo json_encode( ["status"=>"FAIL", "msg"=>__("is-selected-empty-msg"), "data"=>[]] ); die();
        }
        $this->request->allowMethod(['post', 'delete']);
        $this->autoRender  = false;
        if(!$this->_isAuthorized(true)){
            echo json_encode( ["status"=>"FAIL", "msg"=>__("no-auth"), "data"=>[]] ); die();
        }
        $records = json_decode( file_get_contents('php://input'), true);
        $errors = [];
        foreach($records as $rec){
            if(!is_numeric($rec)){continue;}
            $dt= $this->Banks->newEmptyEntity();;
            $dt["id"] = $rec;
            $dt["rec_state"] = $val;
            if(!$this->Banks->save($dt)){
                $errors[] = $dt->getErrors();
            }
        }
        
        if (empty($errors)) {
            $res = ["status"=>"SUCCESS", "data"=>$dt];
        }else{
            $res = ["status"=>"FAIL", "data"=>$dt->getErrors()];
        }
        echo json_encode($res);die();

    }
    

}
