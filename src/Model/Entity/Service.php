<?php

declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

class Service extends Entity
{
    protected $_accessible = [
        'user_id' => true,
        'package_id' => true,
        'owner_id' => true,
        'tenant_id' => true,
        'property_id' => true,
        'service_vat' => true,
        'service_tax' => true,
        'service_contract_period' => true,
        'service_desc' => true,
        'stat_created' => true,
        'rec_state' => true,
        'service_price' => true,
        'service_currency' => true,
        'user' => true,
        'owner' => true,
        'tenant' => true,
        'package' => true,
        'property' => true,
        // 'inspect' => true,
        // 'inspect_id' => true,
    ];
}
