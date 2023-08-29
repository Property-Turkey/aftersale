<?php

declare(strict_types=1);

namespace App\Model\Entity;

use Cake\ORM\Entity;

/**
 * Expense Entity
 *
 * @property int $id
 * @property int $user_id
 * @property int $owner_id
 * @property int $expense_type
 * @property int $expense_amount
 * @property int|null $expense_currency
 * @property string|null $expense_configs
 * @property \Cake\I18n\FrozenTime $stat_created
 * @property int $rec_state
 *
 * @property \App\Model\Entity\User $user
 * @property \App\Model\Entity\User $owner
 * @property \App\Model\Entity\Service $service
 */
class Expense extends Entity
{
    /**
     * Fields that can be mass assigned using newEntity() or patchEntity().
     *
     * Note that when '*' is set to true, this allows all unspecified fields to
     * be mass assigned. For security purposes, it is advised to set '*' to false
     * (or remove it), and explicitly make individual fields accessible as needed.
     *
     * @var array<string, bool>
     */
    protected $_accessible = [
        'user_id' => true,
        'owner_id' => true,
        'category_id' => true,
        'expense_type' => true,
        'expense_amount' => true,
        'expense_currency' => true,
        'expense_description' => true,
        'stat_created' => true,
        'rec_state' => true,
        'user' => true,
        'owner' => true,
        'service' => true,
        'category' => true,
    ];
}
