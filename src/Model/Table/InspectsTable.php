<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class InspectsTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('inspects');
        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->belongsTo('Users', [
            'foreignKey' => 'user_id',
            'className' => 'Users',
        ]);

        $this->belongsTo('admin.root', [
            'className' => 'Users',
            'foreignKey' => 'owner_id',
        ]);

        $this->belongsTo('Services', [
            'foreignKey' => 'service_id',
            'className' => 'Services',
        ]);
		$this->addBehavior('Log');
    }

    public function validationDefault(Validator $validator): Validator
    {
        // $validator
        //     ->notEmptyString('service_desc');

        // $validator
        //     ->integer('service_price')
        //     ->notEmptyString('service_price');

        // $validator
        //     ->integer('service_vat')
        //     ->notEmptyString('service_vat');

        // $validator
        //     ->integer('service_tax')
        //     ->notEmptyString('service_tax');

        // $validator
        //     ->integer('service_contract_period')
        //     ->notEmptyString('service_contract_period')
        //     ->numeric('service_contract_period');

        return $validator;
    }

    public function buildRules(RulesChecker $rules): RulesChecker
    {
        // $rules->add($rules->existsIn('parent_id', 'ParentCategories'), ['errorField' => 'parent_id']);

        return $rules;
    }
}
