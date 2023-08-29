<?php
declare(strict_types=1);

namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class DocsTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('docs');
        $this->setDisplayField('doc_name');
        $this->setPrimaryKey('id');

        $this->belongsTo('Properties', [
            'foreignKey' => 'tar_id',
            'joinType' => 'INNER',
        ])->setConditions(['tar_tbl'=>1]);
        
        $this->belongsTo('Projects', [
            'foreignKey' => 'tar_id',
            'joinType' => 'INNER',
        ])->setConditions(['tar_tbl'=>2]);
    }

    public function validationDefault(Validator $validator): Validator
    {
        $validator
            ->integer('id')
            ->allowEmptyString('id', null, 'create');

        $validator
            ->requirePresence('tar_tbl', 'create')
            ->notEmptyString('tar_tbl');

        $validator
            ->scalar('doc_name')
            ->maxLength('doc_name', 255)
            ->requirePresence('doc_name', 'create')
            ->notEmptyString('doc_name');

        $validator
            ->notEmptyString('rec_state');

        return $validator;
    }

    public function buildRules(RulesChecker $rules): RulesChecker
    {
        // $rules->add($rules->existsIn('tar_id', 'Tars'), ['errorField' => 'tar_id']);

        return $rules;
    }
}
