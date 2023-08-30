<?php

declare(strict_types=1);

namespace App\Model\Table;

// use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

class PropertiesTable extends Table
{
    public function initialize(array $config): void
    {
        parent::initialize($config);

        $this->setTable('Ptpms.properties');
        
        $this->setDisplayField('property_title');
        $this->setPrimaryKey('id');

        $this->hasOne('Services', [
            'className' => 'Services',
            'foreignKey' => 'id',
            'joinType' => 'INNER',
            'propertyName' => 'property'
        ]);

    }

    public function validationDefault(Validator $validator): Validator
    {
        return $validator;
    }
    public static function defaultConnectionName(): string
    {
        return 'Ptpms';
    }
    public function buildRules(RulesChecker $rules): RulesChecker
    {
        return $rules;
    }
}
