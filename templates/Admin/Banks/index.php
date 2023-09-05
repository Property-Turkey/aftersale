<?php
$pid = !isset($this->request->getParam('pass')[0]) ? null : $this->request->getParam('pass')[0];
?>

<div class="right_col" role="main" ng-init="
        doGet('/admin/banks/index/<?= $pid ?>?list=1', 'list', 'banks');
    ">
    <div class="">
        <div class="page-title">
            <div class=" col-6 col-sm-6 col-md-6 side_div1">
                <h3><?= __('banks_list') ?></h3>
            </div>
            <div class=" col-6 col-sm-6 col-md-6 side_div2">
                <span class="icn">
                    <a href ng-click="
                            newEntity('bank');
                            openModal('#addEditBank_mdl');
                        " class="btn btn-info">
                        <span class="fa fa-plus"></span> <span class="hideMob"><?= __('add_bank') ?></span>
                    </a>
                </span>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-12">
                <div class="x_panel">

                    <div id="main_preloader" class="preloader">
                        <div>
                            <i class="fa fa-refresh fa-spin fa-3x fa-fw"></i>
                        </div>
                        <div><?= __('please_wait') ?></div>
                    </div>

                    <div class="x_title">
                        <h2><b><?= __('banks_list') ?></b><br>
                            <span> <?= __('show') . ' ' . __('from') ?>
                                {{ paging.start  }} <?= __('to') ?>
                                {{ paging.end }} <?= __('of') ?> {{ paging.count }} </span>
                        </h2>

                        <ul class="nav navbar-right panel_toolbox">                      
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <div class="dropdown-menu  <?= $currlang != 'ar' ? 'dropdown-menu-right' : '' ?>">
                                    <a href ng-click="multiHandle('/admin/banks/enable/1')" class="dropdown-item">
                                        <i class="fa fa-check"></i> <?= __('enable_selected') ?>
                                    </a>
                                    <a href ng-click="multiHandle('/admin/banks/enable/0')" class="dropdown-item">
                                        <i class="fa fa-times"></i> <?= __('disable_selected') ?>
                                    </a>
                                    <a href ng-click="multiHandle('/admin/banks/delete')" class="dropdown-item">
                                        <i class="fa fa-trash"></i> <?= __('delete_selected') ?>
                                    </a>
                                </div>
                            </li>                           
                        </ul>

                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                        <div class="grid ">

                            <div class="grid_header row">

                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'banks/index/', 'col' => 'id']) ?>
                                    <label class="mycheckbox">
                                        <input type="checkbox" ng-click="chkAll('.chkb', !selectAll)" ng-model="selectAll">
                                        <span></span>
                                        <?= __('id') ?>
                                    </label>
                                </div>
                                 <?php /*<div class="col-sm-3 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'banks_information']) ?> 
                                    <?= __('banks_information') ?> </div>  */?>

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'banks/index/', 'col' => 'bank_ownername']) ?>
                                    <?= __('bank_ownername') ?> </div>

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'banks/index/', 'col' => 'bank_name']) ?>
                                    <?= __('bank_name') ?> </div>

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'banks/index/', 'col' => 'bank_number']) ?>
                                    <?= __('bank_number') ?> </div>

                                 <?php /*<div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'banks/index/', 'col' => 'bank_expiredate']) ?> 
                                    <?= __('bank_expiredate') ?> </div>

                                    <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'banks/index/', 'col' => 'bank_cvv']) ?> 
                                    <?= __('bank_cvv') ?> </div>

                                    <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'banks/index/', 'col' => 'bank_swift']) ?> 
                                    <?= __('bank_swift') ?> </div>  */?>


                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'banks/index/', 'col' => 'rec_state', 'filter' => $this->Do->lcl($this->Do->get('rec_state'))]) ?>
                                    <?= __('rec_state') ?> </div>

                                <div class="col-sm-2 col hideMob"><span class="nobr"><?= __('action') ?></span>
                                </div>
                            </div>
                           
                            <div class="grid_row row" ng-repeat="itm in lists.banks">

                                <div class="col-sm-1 hideMobSm grid_header">
                                    <label class="mycheckbox chkb">
                                        <input type="checkbox" ng-model="selected[itm.id]" ng-value="{{itm.id}}">
                                        <span></span> {{ itm.id }} <a href="<?= $app_folder ?>/admin/banks/index/{{itm.id}}"><i></i></a>
                                    </label>
                                </div>
                                <div class="col-4 hideWeb grid_header">
                                    <?= __('id') ?>
                                    <label class="mycheckbox chkb">
                                        <input type="checkbox" ng-model="selected[itm.id]" ng-value="{{itm.id}}">
                                        <span></span>
                                    </label>
                                </div>
                                <div class="col-md-1 col-8 hideWeb">{{ itm.id }}</div>
                              

                               <?php /* <div class="col-3 hideWeb grid_header"><?= __('banks_information') ?></div>
                                <div class=" col-3">      
                                <div style="color:red;">
                                    bank_ownername:{{ itm.bank_ownername }}
                                    </div>
                                    <div style="color:blue;">
                                    bank_name:{{itm.bank_name }}
                                    </div>                             
                                    <div style="color:black;">
                                    bank_number:{{ itm.bank_number }}
                                    </div> 
                                    <!-- <div style="color:red;">
                                    bank_expiredate: {{ itm.bank_expiredate }}
                                    </div>
                                    <div style="color:blue;">
                                    bank_cvv: {{ itm.bank_cvv }}
                                    </div>
                                    <div style="color:blblackblackue;">
                                    bank_swift: {{ itm.bank_swift }}
                                    </div>                                                
                                </div> */?>
                                <div class="col-4 hideWeb grid_header"><?= __('bank_ownername') ?></div>
                                <div class="col-md-2 col-8">{{ itm.bank_ownername }} </div>


                                <div class="col-4 hideWeb grid_header"><?= __('bank_name') ?></div>
                                <div class="col-md-2 col-8">{{ itm.bank_name }} </div>

                                <div class="col-4 hideWeb grid_header"><?= __('bank_number') ?></div>
                                <div class="col-md-2 col-8">{{ itm.bank_number }} </div>

                                 <?php /*<div class="col-4 hideWeb grid_header"><?= __('bank_expiredate') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('langs', itm.bank_expiredate)"></div>

                                <div class="col-4 hideWeb grid_header"><?= __('bank_cvv') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('langs', itm.bank_cvv)"></div>
                               
                                <div class="col-4 hideWeb grid_header"><?= __('bank_swift') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('langs', itm.bank_swift)"></div> */?>

                                <div class="col-4 hideWeb grid_header"><?= __('rec_state') ?></div>
                                <div class="col-md-2 col-8" ng-bind-html="DtSetter('bool2', itm.rec_state)"></div>

                                <div class="col-4 hideWeb grid_header"><?= __('actions') ?></div>
                                <div class="col-md-2 col-8 action">
                                    <a href ng-click="
                                    doGet('/admin/banks?id='+itm.id, 'rec', 'bank');
                                        openModal('#viewBank_mdl');
                                        "><i class="fa fa-eye"></i> <?= __('view') ?></a>
                                    <a href ng-click=" 
                                    doGet('/admin/banks?id='+itm.id, 'rec', 'bank');
                                        openModal('#addEditBank_mdl');
                                        ">
                                        <i class="fa fa-pencil"></i> <?= __('edit') ?>
                                    </a>

                                </div>

                            </div>
                            <?php echo $this->element('paginator-ng') ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php echo $this->element('Modals/addEditBank') ?>
    <?php echo $this->element('Modals/viewBank') ?>