<?php
/**
 * @var \App\View\AppView $this
 * @var iterable<\App\Model\Entity\Expense> $expenses
 */
?>
<div class="expenses index content">
    <?= $this->Html->link(__('New Expense'), ['action' => 'add'], ['class' => 'button float-right']) ?>
    <h3><?= __('Expenses') ?></h3>
    <div class="table-responsive">
        <table>
            <thead>
                <tr>
                    <th><?= $this->Paginator->sort('id') ?></th>
                    <th><?= $this->Paginator->sort('user_id') ?></th>
                    <th><?= $this->Paginator->sort('owner_id') ?></th>
                    <th><?= $this->Paginator->sort('expense_type') ?></th>
                    <th><?= $this->Paginator->sort('expense_amount') ?></th>
                    <th><?= $this->Paginator->sort('expense_currency') ?></th>
                    <th><?= $this->Paginator->sort('expense_configs') ?></th>
                    <th><?= $this->Paginator->sort('stat_created') ?></th>
                    <th><?= $this->Paginator->sort('rec_state') ?></th>
                    <th class="actions"><?= __('Actions') ?></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($expenses as $expense): ?>
                <tr>
                    <td><?= $this->Number->format($expense->id) ?></td>
                    <td><?= $expense->has('user') ? $this->Html->link($expense->user->user_fullname, ['controller' => 'Users', 'action' => 'view', $expense->user->id]) : '' ?></td>
                    <td><?= $expense->has('owner') ? $this->Html->link($expense->owner->user_fullname, ['controller' => 'Users', 'action' => 'view', $expense->owner->id]) : '' ?></td>
                    <td><?= $expense->has('service') ? $this->Html->link($expense->service->id, ['controller' => 'Services', 'action' => 'view', $expense->service->id]) : '' ?></td>
                    <td><?= $this->Number->format($expense->expense_type) ?></td>
                    <td><?= $this->Number->format($expense->expense_amount) ?></td>
                    <td><?= $expense->expense_currency === null ? '' : $this->Number->format($expense->expense_currency) ?></td>
                    <td><?= h($expense->expense_configs) ?></td>
                    <td><?= h($expense->stat_created) ?></td>
                    <td><?= $this->Number->format($expense->rec_state) ?></td>
                    <td class="actions">
                        <?= $this->Html->link(__('View'), ['action' => 'view', $expense->id]) ?>
                        <?= $this->Html->link(__('Edit'), ['action' => 'edit', $expense->id]) ?>
                        <?= $this->Form->postLink(__('Delete'), ['action' => 'delete', $expense->id], ['confirm' => __('Are you sure you want to delete # {0}?', $expense->id)]) ?>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="paginator">
        <ul class="pagination">
            <?= $this->Paginator->first('<< ' . __('first')) ?>
            <?= $this->Paginator->prev('< ' . __('previous')) ?>
            <?= $this->Paginator->numbers() ?>
            <?= $this->Paginator->next(__('next') . ' >') ?>
            <?= $this->Paginator->last(__('last') . ' >>') ?>
        </ul>
        <p><?= $this->Paginator->counter(__('Page {{page}} of {{pages}}, showing {{current}} record(s) out of {{count}} total')) ?></p>
    </div>
</div>
