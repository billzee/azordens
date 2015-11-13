<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Customer'), ['action' => 'edit', $customer->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Customer'), ['action' => 'delete', $customer->id], ['confirm' => __('Are you sure you want to delete # {0}?', $customer->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Customers'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Customer'), ['action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="customers view large-9 medium-8 columns content">
    <h3><?= h($customer->name) ?></h3>
    <table class="vertical-table">
        <tr>
            <th><?= __('Id') ?></th>
            <td><?= $this->Number->format($customer->id) ?></td>
        </tr>
        <tr>
            <th><?= __('Group') ?></th>
            <td><?= $this->Number->format($customer->group) ?></td>
        </tr>
        <tr>
            <th><?= __('Creation') ?></th>
            <td><?= h($customer->creation) ?></td>
        </tr>
    </table>
    <div class="row">
        <h4><?= __('Name') ?></h4>
        <?= $this->Text->autoParagraph(h($customer->name)); ?>
    </div>
    <div class="row">
        <h4><?= __('Email') ?></h4>
        <?= $this->Text->autoParagraph(h($customer->email)); ?>
    </div>
    <div class="row">
        <h4><?= __('Type') ?></h4>
        <?= $this->Text->autoParagraph(h($customer->type)); ?>
    </div>
    <div class="row">
        <h4><?= __('Document') ?></h4>
        <?= $this->Text->autoParagraph(h($customer->document)); ?>
    </div>
    <div class="row">
        <h4><?= __('Telephone') ?></h4>
        <?= $this->Text->autoParagraph(h($customer->telephone)); ?>
    </div>
</div>
