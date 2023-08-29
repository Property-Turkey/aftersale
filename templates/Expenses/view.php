<?php
/**
 * @var \App\View\AppView $this
 * @var \App\Model\Entity\Expense $expense
 */
?>
<div class="row">
    <aside class="column">
        <div class="side-nav">
            <h4 class="heading"><?= __('Actions') ?></h4>
            <?= $this->Html->link(__('Edit Expense'), ['action' => 'edit', $expense->id], ['class' => 'side-nav-item']) ?>
            <?= $this->Form->postLink(__('Delete Expense'), ['action' => 'delete', $expense->id], ['confirm' => __('Are you sure you want to delete # {0}?', $expense->id), 'class' => 'side-nav-item']) ?>
            <?= $this->Html->link(__('List Expenses'), ['action' => 'index'], ['class' => 'side-nav-item']) ?>
            <?= $this->Html->link(__('New Expense'), ['action' => 'add'], ['class' => 'side-nav-item']) ?>
        </div>
    </aside>
    <div class="column-responsive column-80">
        <div class="expenses view content">
            <h3><?= h($expense->id) ?></h3>
            <table>
                <tr>
                    <th><?= __('User') ?></th>
                    <td><?= $expense->has('user') ? $this->Html->link($expense->user->user_fullname, ['controller' => 'Users', 'action' => 'view', $expense->user->id]) : '' ?></td>
                </tr>
                <tr>
                    <th><?= __('Owner') ?></th>
                    <td><?= $expense->has('owner') ? $this->Html->link($expense->owner->user_fullname, ['controller' => 'Users', 'action' => 'view', $expense->owner->id]) : '' ?></td>
                </tr>
                <tr>
                    <th><?= __('Expense Configs') ?></th>
                    <td><?= h($expense->expense_configs) ?></td>
                </tr>
                <tr>
                    <th><?= __('Id') ?></th>
                    <td><?= $this->Number->format($expense->id) ?></td>
                </tr>
                <tr>
                    <th><?= __('Expense Type') ?></th>
                    <td><?= $this->Number->format($expense->expense_type) ?></td>
                </tr>
                <tr>
                    <th><?= __('Expense Amount') ?></th>
                    <td><?= $this->Number->format($expense->expense_amount) ?></td>
                </tr>
                <tr>
                    <th><?= __('Expense Currency') ?></th>
                    <td><?= $expense->expense_currency === null ? '' : $this->Number->format($expense->expense_currency) ?></td>
                </tr>
                <tr>
                    <th><?= __('Rec State') ?></th>
                    <td><?= $this->Number->format($expense->rec_state) ?></td>
                </tr>
                <tr>
                    <th><?= __('Stat Created') ?></th>
                    <td><?= h($expense->stat_created) ?></td>
                </tr>
            </table>
        </div>
    </div>
</div>
