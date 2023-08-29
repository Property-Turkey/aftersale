<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class UserMessageTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('user_message');
        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->belongsTo('Users', [
            'foreignKey' => 'user_id',
            'joinType' => 'INNER',
        ]);
        $this->belongsTo('Messages', [
            'foreignKey' => 'message_id',
            'joinType' => 'INNER',
        ]);
    }
    
    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->integer('id')
            ->allowEmptyString('id', null, 'create');

        $validator
            ->dateTime('stat_created')
            ->notEmptyDateTime('stat_created');

        $validator
            ->notEmptyString('rec_state');

        // $validator
        //     ->scalar('user_id')
        //     ->requirePresence('user_id', 'create')
		// 	->add('user_id', [
        //         'unique' => [
        //             'message'   => __('not_unique_user_id'),
        //             'provider'  => 'table',
        //             'rule'      => 'validateUnique'
        //         ]
        //     ]);
            
        return $validator;
    }
    
    // public function validationIsUserExist(Validator $validator) {
    //     $validator = $this->validationDefault($validator);
    //     $validator->add('user_id', 'unique');
    //     return $validator;
    // }

    public function buildRules(RulesChecker $rules): RulesChecker
    {
        $rules->add($rules->existsIn(['user_id'], 'Users'));
        $rules->add($rules->existsIn(['message_id'], 'Messages'));

        return $rules;
    }
}
