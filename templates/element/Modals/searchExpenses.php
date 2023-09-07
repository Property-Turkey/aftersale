<?php
$ctrl = $this->request->getParam('controller') == 'Properties' ? 'property' : 'project';
$prefix = $this->request->getParam('controller') == 'Properties' ? 'PROP' : 'PROJ';
?>

<div class="modal fade modal-right" id="search_mdl" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="listing-modal-1 modal-dialog modal-lg aside-modal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h2 class="modal-title">
                    <?= __('search_and_filter') ?>
                </h2>
            </div>
            <div class="modal-body">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                            <form method="post" novalidate="novalidate" id="search_form" class="row" ng-submit=" rec.search.page = 1; doSearch(); ">
                        </div>
                    </div>
                    <div class="mb-2  col-sm-8">
                        <label><?= __('Owner Name') ?></label>
                        <div class="div">
                            <?= $this->Form->control('owner_id', [
                                'class' => 'form-control has-feedback-left', 'label' => false,
                                'type' => 'text',
                                'placeholder' => __('owner name'),
                                'ng-change' => 'doSearch()',
                                'ng-model' => 'rec.search.owner_id',
                            ]) ?>
                            <span class="fa fa-address-card form-control-feedback left"></span>
                            <button ng-click="doClick('#submit_btn')" class="onfly_btn"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                    <div class="mb-2 col-sm-8">
                        <label><?= __('expense_amount') ?></label>
                        <div class="div">
                            <?= $this->Form->control('expense_amount', [
                                'class' => 'form-control has-feedback-left', 'label' => false,
                                'type' => 'number',
                                'placeholder' => __('enter amount'),
                                'ng-change' => 'doSearch()',
                                'ng-model' => 'rec.search.expense_amount',
                            ]) ?>
                            <span class="fa fa-mobile form-control-feedback left"></span>
                            <button ng-click="doClick('#submit_btn')" class="onfly_btn"><i class="fa fa-search"></i></button>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-6 form-group has-feedback">
                        <label set-required><?= __("Expense Category") ?></label>
                        <div class="div">

                            <!-- Client select input -->
                            <select class="form-control has-feedback-left" ng-model="rec.search.category_id" ng-change="doSearch()">
                                <option value="">Select Expense Category</option>
                                <?php foreach ($optionsExpenses as $key => $option) : ?>
                                    <option value="<?= $key ?>"><?= $option ?></option>
                                <?php endforeach; ?>
                            </select>
                            <span class="fa fa-object-group form-control-feedback left" aria-hidden="true"></span>
                            <button ng-click="doClick('#submit_btn')" class="onfly_btn"><i class="fa fa-search"></i></button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>