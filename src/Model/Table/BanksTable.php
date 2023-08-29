<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class BanksTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('banks');
        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->belongsTo('Users', [
            'foreignKey' => 'user_id',
            'className' => 'Users',
            'joinType' => 'INNER',
            'dependent' => true,
            'cascadeCallbacks' => true,
        ]);      
       
		$this->addBehavior('Log');
    }

    public function validationDefault(Validator $validator): Validator
    {
         $validator
             ->notEmptyString('bank_ownername')
             ->requirePresence('bank_ownername', 'create');
             
             $validator
             ->notEmptyString('bank_name')
             ->requirePresence('bank_name', 'create');

             $validator
             ->integer('bank_number')
             ->notEmptyString('bank_number')
             ->requirePresence('bank_number', 'create');

            //  $validator
            //  ->notEmptyString('bank_expiredate')
            //  ->requirePresence('bank_expiredate', 'create');

            

        return $validator;
    }

    public function buildRules(RulesChecker $rules): RulesChecker
    {
        // $rules->add($rules->existsIn('parent_id', 'ParentCategories'), ['errorField' => 'parent_id']);

        return $rules;
    }
}
