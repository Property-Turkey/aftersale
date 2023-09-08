<?php

declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class ServicesTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('services');

        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->belongsTo('Users', [
            'foreignKey' => 'user_id',
            'className' => 'Users',
            'joinType' => 'INNER',
            'dependent' => true,
            'cascadeCallbacks' => true,
        ]);
        $this->belongsTo('Tenant', [
            'className' => 'Users',
            'foreignKey' => 'tenant_id',
        ]);
        $this->hasMany('Docs', [
            'className' => 'Docs',
            'foreignKey' => 'tar_id',
        ]);
        $this->belongsTo('Owner', [
            'className' => 'Users',
            'foreignKey' => 'owner_id',
        ]);
        $this->belongsTo('Packages', [
            'className' => 'Packages',
            'foreignKey' => 'package_id',
        ]);
        $this->belongsTo('Properties', [
            'className' => 'App.Properties',
            'foreignKey' => 'property_id',
        ]);
        $this->hasMany('Inspects', [
            'className' => 'Inspects',
            'foreignKey' => 'service_id',
        ]);


        $this->addBehavior('Log');
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->notEmptyString('service_desc');

        $validator
            ->notEmptyString('owner_id');

        $validator
            ->integer('service_price')
            ->notEmptyString('service_price');

        $validator
            ->integer('service_currency')
            ->notEmptyString('service_currency');

        $validator
            ->integer('service_vat')
            ->notEmptyString('service_vat');

        $validator

            ->notEmptyString('service_tax');

        $validator
            ->integer('service_contract_period')
            ->notEmptyString('service_contract_period')
            ->numeric('service_contract_period');

        return $validator;
    }

    public function buildRules(RulesChecker $rules): RulesChecker
    {
        // $rules->add($rules->existsIn('parent_id', 'ParentCategories'), ['errorField' => 'parent_id']);

        return $rules;
    }
}
