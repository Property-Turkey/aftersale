<?php
$pid = !isset($this->request->getParam('pass')[0]) ? null : $this->request->getParam('pass')[0];

?>

<div class="right_col" role="main" ng-init="
        doGet('/admin/expenses/index/<?= $pid ?>?list=1', 'list', 'expenses');
    ">
    <div class="">
        <div class="page-title">
            <div class=" col-6 col-sm-6 col-md-6 side_div1">
                <h3><?= __('expenses_list') ?></h3>
            </div>
            <div class=" col-6 col-sm-6 col-md-6 side_div2">
                <span class="icn">
                    <a href ng-click="
                            newEntity('expense');
                            openModal('#addEditExpense_mdl');
                        " class="btn btn-info">
                        <span class="fa fa-plus"></span> <span class="hideMob"><?= __('add_expense') ?></span>
                    </a>
                </span>
            </div>
            <div class=" col-6 col-sm-6 col-md-6 side_div2">
                <span class="icn">
                    <a href data-toggle="modal" data-target="#search_mdl" data-dismiss="modal" class="btn btn-info">
                        <span class="fa fa-search"></span> <span class="hideMob"><?= __('search') ?></span>
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
                        <h2><b><?= __('expenses_list') ?></b><br>
                            <span> <?= __('show') . ' ' . __('from') ?>
                                {{ paging.start  }} <?= __('to') ?>
                                {{ paging.end }} <?= __('of') ?> {{ paging.count }} </span>
                        </h2>

                        <ul class="nav navbar-right panel_toolbox">
                            <!-- <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li> -->
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <div class="dropdown-menu  <?= $currlang != 'ar' ? 'dropdown-menu-right' : '' ?>">
                                    <a href ng-click="multiHandle('/admin/expenses/enable/1')" class="dropdown-item">
                                        <i class="fa fa-check"></i> <?= __('enable_selected') ?>
                                    </a>
                                    <a href ng-click="multiHandle('/admin/expenses/enable/0')" class="dropdown-item">
                                        <i class="fa fa-times"></i> <?= __('disable_selected') ?>
                                    </a>
                                    <a href ng-click="multiHandle('/admin/expenses/delete')" class="dropdown-item">
                                        <i class="fa fa-trash"></i> <?= __('delete_selected') ?>
                                    </a>
                                </div>
                            </li>
                            <!-- <li><a class="close-link"><i class="fa fa-close"></i></a> 
                            </li>-->
                        </ul>

                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                        <div class="grid ">

                            <div class="grid_header row">

                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'expenses/index/', 'col' => 'id']) ?>
                                    <label class="mycheckbox">
                                        <input type="checkbox" ng-click="chkAll('.chkb', !selectAll)" ng-model="selectAll">
                                        <span></span>
                                        <?= __('id') ?>
                                    </label>
                                </div>

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'expenses/index/', 'col' => 'owner_id']) ?>
                                    <?= __('owner_id') ?> </div>

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'expenses/index/', 'col' => 'expense_type', 'filter' => $this->Do->lcl($this->Do->get('expense_type'))]) ?>
                                    <?= __('expense_type') ?> </div>

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'expenses/index/', 'col' => 'expense_amount']) ?>
                                    <?= __('expense_amount') ?> </div>

                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'expenses/index/', 'col' => 'category_id']) ?>
                                    <?= __('category_id') ?> </div>

                                <?php /* <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'expenses/index/', 'col' => 'expense_currency', 'filter' => $this->Do->lcl($this->Do->get('currencies'))]) ?>
                                    <?= __('expense_currency') ?> </div> 

                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'expenses/index/', 'col' => 'stat_created']) ?>
                                    <?= __('stat_created') ?> </div> 

                                 <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'expenses/index/', 'col' => 'rec_state', 'filter' => $this->Do->lcl($this->Do->get('rec_state'))]) ?>
                                    <?= __('rec_state') ?> </div>   */ ?>


                                <div class="col-sm-1 col hideMob"><span class="nobr"><?= __('action') ?></span>
                                </div>
                            </div>

                            <div class="grid_row row" ng-repeat="itm in lists.expenses ">


                                <div class="col-sm-1 hideMobSm grid_header">
                                    <label class="mycheckbox chkb">
                                        <input type="checkbox" ng-model="selected[itm.id]" ng-value="{{itm.id}}">
                                        <span></span> {{ itm.id }} <a href="<?= $app_folder ?>/admin/expenses/index/{{itm.id}}"></a>
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

                                <div class="col-4 hideWeb grid_header"><?= __('owner_id') ?></div>
                                <a class="col-md-2" href="<?= $app_folder ?>/admin/expenses/index/{{itm.owner.user_fullname}}">{{ itm.owner.user_fullname }}</a>

                                <div class="col-4 hideWeb grid_header"><?= __('expense_type') ?></div>
                                <div class="col-md-2 col-8" ng-bind-html="DtSetter('', itm.expense_type) == 1 ? 'income' : 'outgoing'"></div>

                                <div class="col-4 hideWeb grid_header "><?= __('expense_amount') ?></div>
                                <div class="col-md-2 col-8">{{DtSetter('currencies_icons', itm.expense_currency)}} {{ itm.expense_amount }} </div>

                                <div class="col-4 hideWeb grid_header "><?= __('category_id') ?></div>
                                <div class="col-md-1 col-8">{{ itm.category.category_name }} </div>
                               
                                <?php /* <div class="col-4 hideWeb grid_header"><?= __('expense_currency') ?></div>
                                <div class="col-md-2 col-8" ng-bind-html="DtSetter('currency', itm.expense_currency)"></div> 

                                 <div class="col-4 hideWeb grid_header"><?= __('stat_created ') ?></div>
                                <div class="col-md-1 col-8">{{ itm.stat_created }} </div> 

                               <div class="col-4 hideWeb grid_header"><?= __('rec_state') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('rec_state', itm.rec_state)"></div> */ ?>


                                <div class="col-4 hideWeb grid_header"><?= __('actions') ?></div>
                                <div class="col-md-1 col-8 action">
                                    <a href ng-click="
                                    doGet('/admin/expenses?id='+itm.id, 'rec', 'expense');
                                        openModal('#viewExpense_mdl');
                                        "><i class="fa fa-eye"></i> <?= __('view') ?></a>
                                    <a href ng-click=" 
                                    doGet('/admin/expenses?id='+itm.id, 'rec', 'expense');
                                        openModal('#addEditExpense_mdl');
                                        "><i class="fa fa-pencil"></i> <?= __('edit') ?></a>

                                </div>
                            </div>

                        </div>
                        <?php echo $this->element('paginator-ng') ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php echo $this->element('Modals/addEditExpense') ?>
<?php echo $this->element('Modals/viewExpense') ?>
<?php echo $this->element('Modals/searchExpenses') ?>
<?php echo $this->element('Modals/docs') ?>