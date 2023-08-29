<?php
declare(strict_types=1);

namespace App\Test\Fixture;

use Cake\TestSuite\Fixture\TestFixture;

/**
 * ExpensesFixture
 */
class ExpensesFixture extends TestFixture
{
    /**
     * Init method
     *
     * @return void
     */
    public function init(): void
    {
        $this->records = [
            [
                'id' => 1,
                'user_id' => 1,
                'owner_id' => 1,
                'expense_type' => 1,
                'expense_amount' => 1,
                'expense_currency' => 1,
                'expense_configs' => 'Lorem ipsum dolor sit amet',
                'stat_created' => '2023-08-22 08:47:40',
                'rec_state' => 1,
            ],
        ];
        parent::init();
    }
}
