<?php

declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\AppController;

class ExpensesController extends AppController
{
    public function index()
    {

        if ($this->request->is('post')) {

            $this->autoRender = false;


            // Filters and Search
            $_from = !empty($_GET['from']) ? $_GET['from'] : '';
            $_to = !empty($_GET['to']) ? $_GET['to'] : '';

            $dt = json_decode(file_get_contents('php://input'), true);
            $_method = !empty($_GET['method']) ? $_GET['method'] : '';
            $_col = !empty($_GET['col']) ? $_GET['col'] : 'id';
            $_k = (isset($_GET['k']) && strlen($_GET['k']) > 0) ? $_GET['k'] : false;
            $_dir = !empty($_GET['direction']) ? $_GET['direction'] : 'DESC';

            if (!empty($_from)) {
                $conditions['Expenses.stat_updated > '] = $_from;
            }
            if (!empty($_to)) {
                $conditions['Expenses.stat_updated < '] = $_to;
            }
            if ($_k !== false) {
                $_method == 'like' ?  $conditions[$_col . ' LIKE '] = '%' . $_k . '%' : $conditions['Expenses.' . $_col] = $_k;
            }

            $data = [];
            $_id = $this->request->getQuery('id');
            $_list = $this->request->getQuery('list');

            $noneSearchable = ['page', 'keyword'];
            $betweenFields = ['page', 'keyword']; //exact match
            $likeFields = ['page', 'keyword']; //partial match

            $conditions = [];

            // SEARCH
            if (!empty($dt['search'])) {
                foreach ($dt['search'] as $col => $val) {
                    if (empty($val)) {
                        continue;
                    }
                    if (in_array($col, $noneSearchable)) {
                        continue;
                    }
                    if ($col == 'owner_id') {
                        $conditions['Owner.user_fullname LIKE '] = '%' . $val . '%';
                    } else if ($col == 'expense_amount' || $col == 'category_id') {
                        $conditions[$col] = $val;
                    }
                }
            }

            // ONE RECORD
            if (!empty($_id)) {
                $data = $this->Expenses->get($_id, [
                    'contain' => [
                        "Categories",
                        //         'Users' => ['fields' => ['user_fullname']],                        
                        //         'Owner' => ['fields' => ['user_fullname']],
                        'Owner' => ['fields' => ['user_fullname']],
                        'Docs' => ['fields' => ['Docs.tar_id', 'Docs.id', 'Docs.doc_name', 'Docs.doc_desc', 'Docs.doc_allowed_roles', 'Docs.stat_created']],
                    ]
                ])->toArray();
                $data = $this->Do->convertJson($data);
                echo json_encode(["status" => "SUCCESS",  "data" => $data],  JSON_UNESCAPED_UNICODE);
                die();
            }

            // LIST
            if (!empty($_list)) {
                $data = $this->paginate($this->Expenses, [
                    "order" => [$_col => $_dir],
                    "conditions" => $conditions,
                    "contain" => [
                        "Categories",
                        //'Services.Owner' => ['fields' => ['user_fullname']],
                        // "Users" => ["fields" => ["user_fullname"]],
                        'Owner' => ['fields' => ['user_fullname']],
                    ]
                ]);
                $data = $this->Do->convertJson($data);
            }
            echo json_encode(
                ["status" => "SUCCESS",  "data" => $data, "paging" => $this->request->getAttribute('paging')],
                JSON_UNESCAPED_UNICODE
            );
            die();
        }
        $owners = $this->Expenses->Users->find('list', [
            'conditions' => ['user_role' => 'user.owner']
        ]);

        //list for Expenses Type(for Expenses)
        $parentExpensesIds = [10];
        $categoriesExpenses = $this->getTableLocator()->get('Categories')->find('all')
            ->where(['parent_id IN' => $parentExpensesIds])
            ->toArray();

        $optionsExpenses = [];
        foreach ($categoriesExpenses as $category) {
            $optionsExpenses[$category->id] = $category->category_name;
        }

        $this->set(compact('owners', 'optionsExpenses'));
    }

    public function save($id = -1)
    {
        $this->request->allowMethod(['post', 'put', 'patch']);

        $this->autoRender  = false;
        $dt = json_decode(file_get_contents('php://input'), true);

        if ($this->request->is(['patch', 'put'])) {
            $rec = $this->Expenses->get($dt['id']);
        }
        //add new record
        if ($this->request->is(['post'])) {
            $dt['id'] = null;
            $dt['user_id'] = $this->authUser['id'];
            $rec = $this->Expenses->newEntity($dt);
            // dd($rec);

        }
        $rec = $this->Expenses->patchEntity($rec, $dt, ['associated' => ['Users',]]);

        if ($newRec = $this->Expenses->save($rec)) {
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
        $delRec = $this->Expenses->deleteAll(['id IN ' => explode(",", $id)]);

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
            $dt = $this->Expenses->newEmptyEntity();;
            $dt["id"] = $rec;
            $dt["rec_state"] = $val;
            if (!$this->Expenses->save($dt)) {
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
