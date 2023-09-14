<?php

declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class ExpensesTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('expenses');
        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->belongsTo('Users', [
            'foreignKey' => 'user_id',
            'className' => 'Users',
        ]);
        // $this->belongsTo('Owner', [
        //     'className' => 'Services',
        //     'foreignKey' => 'owner_id',
        // ]);
        $this->belongsTo('Owner', [
            'className' => 'Users',
            'foreignKey' => 'owner_id',
        ]);
        $this->belongsTo('Categories', [
            'className' => 'Categories',
            'foreignKey' => 'category_id',
        ]);
        $this->hasMany('Docs', [
            'className' => 'Docs',
            'foreignKey' => 'tar_id',
        ]);
        
        $this->belongsTo('Services', [
            'foreignKey' => 'owner_id',
            'className' => 'Services',
        ]);

        $this->addBehavior('Log');
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->integer('expense_amount')
            ->scalar('expense_amount')
            ->notEmptyString('expense_amount')
            ->requirePresence('expense_amount', 'create');

        $validator
            ->integer('expense_type')
            ->requirePresence('expense_type', 'create');

        // $validator
        //     ->integer('services_id')
        //     ->requirePresence('services_id', 'create');



        return $validator;
    }

    public function buildRules(RulesChecker $rules): RulesChecker
    {
        // $rules->add($rules->existsIn('parent_id', 'ParentCategories'), ['errorField' => 'parent_id']);

        return $rules;
    }
}
