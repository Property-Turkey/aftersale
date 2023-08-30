<?php

declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class PackagesTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('packages');
        $this->setDisplayField('package_name');
        $this->setPrimaryKey('id');

        // $this->belongsTo('Users', [
        //     'foreignKey' => 'user_id',
        //     'className' => 'Users',
        //     'joinType' => 'INNER',
        //     'dependent' => true,
        //     'cascadeCallbacks' => true,
        // ]);

        $this->hasOne('Services', [
            'foreignKey' => 'service_id',
            'className' => 'Services',
            'dependent' => true,
            'cascadeCallbacks' => true,
        ]);

        $this->addBehavior('Log');
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->notEmptyString('package_name')
            ->requirePresence('package_name', 'create');

        // $validator
        //     ->integer('package_price')
        //     ->requirePresence('package_price', 'create')
        //     ->notEmptyString('package_price');

        // $validator
        //     ->requirePresence('package_period', 'create')
        //     ->notEmptyString('package_period');

        // $validator
        //     ->scalar('category_configs')
        //     ->maxLength('category_configs', 255)
        //     ->allowEmptyString('category_configs');

        // $validator
        //     ->allowEmptyString('category_priority');

        // $validator
        //     ->allowEmptyString('rec_state');

        return $validator;
    }

    public function buildRules(RulesChecker $rules): RulesChecker
    {
        // $rules->add($rules->existsIn('parent_id', 'ParentCategories'), ['errorField' => 'parent_id']);

        return $rules;
    }
}
