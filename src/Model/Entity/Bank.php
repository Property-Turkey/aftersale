<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class Bank extends Entity
{
    
    protected $_accessible = [
        'user_id' => true,
        'bank_ownername' => true,
        'bank_name' => true,
        'bank_number' => true,
        'bank_expiredate' => true,
        'bank_cvv' => true,
        'bank_swift' => true,
        'rec_state' => true,
      
    ];
}
