<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class Inspect extends Entity
{
    
    protected $_accessible = [
        'user_id' => true,
        'service_id' => true,
        'inspect_desc' => true,
        'stat_created' => true,
        'rec_state' => true,
       
    ];
}
