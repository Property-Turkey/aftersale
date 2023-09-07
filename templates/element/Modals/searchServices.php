<?php
$ctrl = $this->request->getParam('controller') == 'Properties' ? 'property' : 'project';
$prefix = $this->request->getParam('controller') == 'Properties' ? 'PROP' : 'PROJ';
?>

<div class="modal fade modal-right" id="searchServiceModal" tabindex="-1" role="dialog" aria-hidden="true">
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
                </div>
                <div class="mb-2  col-sm-11">
                    <label><?= __('Owner Name') ?></label>
                    <div class="div">
                        <?= $this->Form->control('owner_id', [
                            'class' => 'form-control has-feedback-left',
                            'label' => false,
                            'type' => 'text',
                            'placeholder' => __('owner name'),
                            'ng-change' => 'doSearch()',
                            'ng-model' => 'rec.search.owner_id',
                        ]) ?>
                        <span class="fa fa-address-card form-control-feedback left"></span>
                        <button ng-click="doClick('#submit_btn')" class="onfly_btn"><i class="fa fa-search"></i></button>
                    </div>
                </div>
                <div class="mb-2  col-sm-11">
                    <label><?= __('Service Price') ?></label>
                    <div class="div">
                        <?= $this->Form->control('service_price ', [
                            'class' => 'form-control has-feedback-left',
                            'label' => false,
                            'type' => 'number',
                            'placeholder' => __('service price'),
                            'ng-change' => 'doSearch()',
                            'ng-model' => 'rec.search.service_price',
                        ]) ?>
                        <span class="fa fa-money form-control-feedback left"></span>
                        <button ng-click="doClick('#submit_btn')" class="onfly_btn"><i class="fa fa-search"></i></button>
                    </div>
                </div>
                <div class="mb-2  col-sm-11">
                    <label><?= __('Property Ref') ?></label>
                    <div class="div">
                        <?= $this->Form->control('property_id', [
                            'class' => 'form-control has-feedback-left',
                            'label' => false,
                            'type' => 'text',
                            'placeholder' => __('property ref'),
                            'ng-change' => 'doSearch()',
                            'ng-model' => 'rec.search.property_id',
                        ]) ?>
                        <span class="fa fa-header form-control-feedback left"></span>
                        <button ng-click="doClick('#submit_btn')" class="onfly_btn"><i class="fa fa-search"></i></button>
                    </div>
                </div>
                <div class="mb-2  col-sm-11">
                    <label><?= __(' Package Name') ?></label>
                    <div class="div">
                        <?= $this->Form->control('package_id', [
                            'class' => 'form-control has-feedback-left',
                            'label' => false,
                            'type' => 'text',
                            'placeholder' => __('package name'),
                            'ng-change' => 'doSearch()',
                            'ng-model' => 'rec.search.package_id',
                        ]) ?>
                        <span class="fa fa-info form-control-feedback left"></span>
                        <button ng-click="doClick('#submit_btn')" class="onfly_btn"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>