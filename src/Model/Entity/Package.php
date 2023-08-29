<?php
declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class Package extends Entity
{
    
    protected $_accessible = [
        'package_name' => true,
        'package_desc' => true,
        'package_cpi' => true,
        'stat_created' => true,
        'stat_updated' => true,
        'rec_state' => true,
     
    ];
}
