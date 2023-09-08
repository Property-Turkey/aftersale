<?php
$pid = !isset($this->request->getParam('pass')[0]) ? null : $this->request->getParam('pass')[0];
?>

<div class="right_col" role="main" ng-init="
        doGet('/admin/services/index/<?= $pid ?>?list=1', 'list', 'services');">
    <div class="">
        <div class="page-title">
            <div class=" col-6 col-sm-6 col-md-6 side_div1">
                <h3><?= __('services_list') ?></h3>
            </div>
            <div class=" col-6 col-sm-6 col-md-6 side_div2">
                <span class="icn">
                    <a href ng-click="
                            newEntity('service');
                            openModal('#addEditService_mdl');
                            doGet('/admin/services/index?list=1', 'list', 'services');" 

                        class="btn btn-info">
                        <span class="fa fa-plus"></span> <span class="hideMob"><?= __('add_service') ?></span>
                    </a>
                </span>
            </div>
            <div class=" col-6 col-sm-6 col-md-6 side_div2">
                <span class="icn">
                    <a href ng-click="openModal('#searchServiceModal'); "                           
                        class="btn btn-info">
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
                        <h2><b><?= __('services_list') ?></b><br>
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
                                    <a href ng-click="multiHandle('/admin/services/enable/1')" class="dropdown-item">
                                        <i class="fa fa-check"></i> <?= __('enable_selected') ?>
                                    </a>
                                    <a href ng-click="multiHandle('/admin/services/enable/0')" class="dropdown-item">
                                        <i class="fa fa-times"></i> <?= __('disable_selected') ?>
                                    </a>
                                    <a href ng-click="multiHandle('/admin/services/delete')" class="dropdown-item">
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
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'id']) ?>
                                    <label class="mycheckbox">
                                        <input type="checkbox" ng-click="chkAll('.chkb', !selectAll)" ng-model="selectAll">
                                        <span></span>
                                        <?= __('id') ?>
                                    </label>
                                </div>
                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'services_information']) ?>
                                    <?= __('services_information') ?> </div>

                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'service_price']) ?>
                                    <?= __('service_price') ?> </div>

                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'property_ref']) ?>
                                    <?= __('property_ref') ?> </div>

                                <?php /* <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'tenant_id']) ?> 
                                    <?= __('tenant_id') ?> </div>
                                                          
                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'service_vat']) ?> 
                                    <?= __('service_vat') ?> </div>

                                    <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'service_tax']) ?> 
                                    <?= __('service_tax') ?> </div> 

                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'service_contract_period']) ?>
                                    <?= __('servicecont_period') ?> </div>  */ ?>

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'package_name']) ?>
                                    <?= __('package_name') ?> </div>

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'expiration_date']) ?>
                                    <?= __('expiration_date') ?> </div>

                                <?php /* <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'stat_created']) ?>
                                    <?= __('stat_created') ?> </div>

                                     <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'expiration_date']) ?>
                                    <?= __('expiration_date') ?> </div>*/ ?>

                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'rec_state', 'filter' => $this->Do->lcl($this->Do->get('rec_state'))]) ?>
                                    <?= __('rec_state') ?> </div>

                                <div class="col-sm-1 col hideMob"><span class="nobr"><?= __('action') ?></span>
                                </div>
                            </div>

                            <div class="grid_row row" ng-repeat="itm in lists.services">

                                <div class="col-sm-1 hideMobSm grid_header">
                                    <label class="mycheckbox chkb">
                                        <input type="checkbox" ng-model="selected[itm.id]" ng-value="{{itm.id}}">
                                        <span></span> {{ itm.id }} <a href="<?= $app_folder ?>/admin/services/index/{{itm.id}}"><i class=""></i></a>
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
                                <div class="col-4 hideWeb grid_header"><?= __('services_information') ?></div>
                                <div class=" col-md-2 col-8">
                                    <div class="">
                                        <b> Owner Name:</b>{{ itm.owner.user_fullname}}
                                    </div>
                                    <div class="">
                                        <b>Service Contract Period:</b>{{ itm.service_contract_period}}
                                    </div>
                                </div>
                                <div class="col-4 hideWeb grid_header"><?= __('service_price') ?></div>
                                <div class="col-md-1 col-8">{{DtSetter('currencies_icons', itm.service_currency)}} {{itm.service_price }} </div>

                                <div class="col-4 hideWeb grid_header"><?= __('property_ref') ?></div>
                                <div class="col-md-1 col-8">{{ itm.property.property_ref }} </div>

                                <?php /* <div class="col-4 hideWeb grid_header"><?= __('tenant_id ',) ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('', itm.tenant.user_fullname )"></div>   
                                                                                                                                                      
                               <div class="col-4 hideWeb grid_header"><?= __('service_vat ') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('', itm.service_vat +'%' )"></div>

                                <div class="col-4 hideWeb grid_header"><?= __('service_tax ') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('', itm.service_tax +'%' )"></div> 

                                <div class="col-4 hideWeb grid_header"><?= __('service_contract_period ') ?></div>
                                <div class="col-md-1 col-8">{{ itm.service_contract_period }} </div> 

                              <div class="col-4 hideWeb grid_header"><?= __('service_desc ') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('', itm.service_desc )"></div> */ ?>

                                <div class="col-4 hideWeb grid_header"><?= __('package_name') ?></div>
                                <div class="col-md-1 col-8">
                                    {{itm.package.package_name}}
                                </div>
                                <!-- <div class="col-4 hideWeb grid_header"><?= __('total_price') ?></div> -->
                                <div class=" col-md-1">
                                    <div ng-repeat=" item in itm.service_package" class="redtext">
                                    </div>
                                    <div class="blueText">
                                    </div>
                                    <div class="redtext">
                                    </div>
                                    <div class="redtext">
                                    </div>
                                </div>
                                <div class="col-4 hideWeb grid_header"><?= __('expiration_date') ?></div>
                                <div class="col-md-2 col-8">
                                    <div class="text-success col-md-2 col-8" ng-class="{ 'text-warning': isExpiringSoon(itm.stat_created, itm.service_contract_period) }">
                                        {{ itm.expiration_date }}
                                    </div>
                                </div>
                                <div class="col-4 hideWeb grid_header"><?= __('rec_state') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('bool2', itm.rec_state)"></div>

                                <div class="col-4 hideWeb grid_header"><?= __('actions') ?></div>
                                <div class="col-md-1 col-8 action">
                                    <a href ng-click="                       
                                        doGet('/admin/services?id='+itm.id, 'rec', 'service');
                                        openModal('#viewService_mdl');" class="inline-btn">
                                        <i class="fa fa-eye"></i> <?= __('view') ?></a>
                                    <a href ng-click=" 
                                    doGet('/admin/services?id='+itm.id, 'rec', 'service');
                                        openModal('#addEditService_mdl');" class="inline-btn">
                                        <i class="fa fa-pencil"></i> <?= __('edit') ?>
                                    </a>
                                    <a href ng-click=" newEntity('inspect');
                                        rec.inspect.service_id = itm.id;
                                        openModal('#addEditInspect_mdl');" class="inline-btn">
                                        <i class="fa fa-plus"></i> <?= __('add_inspect') ?>
                                    </a>
                                </div>
                            </div>
                        </div>
                     <?php echo $this->element('paginator-ng') ?>
                    </div>
                </div>
             </div>
           <div>
        </div>
      </div>
  </div>
    <?php echo $this->element('Modals/addEditService') ?>
    <?php echo $this->element('Modals/addEditInspect') ?>
    <?php echo $this->element('Modals/searchServices') ?>
    <?php echo $this->element('Modals/docs') ?>
    <?php echo $this->element('Modals/viewService') ?>