<?php
$pid = !isset($this->request->getParam('pass')[0]) ? null : $this->request->getParam('pass')[0];
?>

<div class="right_col" role="main" ng-init="
        doGet('/admin/docs/index/<?= $pid ?>?list=1', 'list', 'docs');
    ">
    <div class="">
        <div class="page-title">
            <div class=" col-6 col-sm-6 col-md-6 side_div1">
                <h3><?= __('docs_list') ?></h3>
            </div>
            <div class=" col-6 col-sm-6 col-md-6 side_div2">
                <span class="icn">
                    <a href ng-click="
                            newEntity('doc');
                            openModal('#addEditDoc_mdl');
                        " class="btn btn-info">
                        <span class="fa fa-plus"></span> <span class="hideMob"><?= __('add_doc') ?></span>
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
                        <h2><b><?= __('docs_list') ?></b>
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
                                    <a href ng-click="multiHandle('/admin/docs/enable/1')" class="dropdown-item">
                                        <i class="fa fa-check"></i> <?= __('enable_selected') ?>
                                    </a>
                                    <a href ng-click="multiHandle('/admin/docs/enable/0')" class="dropdown-item">
                                        <i class="fa fa-times"></i> <?= __('disable_selected') ?>
                                    </a>
                                    <a href ng-click="multiHandle('/admin/docs/delete')" class="dropdown-item">
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

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => 'id']) ?>
                                    <label class="mycheckbox">
                                        <input type="checkbox" ng-click="chkAll('.chkb', !selectAll)" ng-model="selectAll">
                                        <span></span>
                                        <?= __('id') ?>
                                    </label>
                                </div>

                                <!-- <div class="col-sm-3 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'docs_information']) ?>
                                    <?= __('docs_information') ?> </div> -->

                                <!-- <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'price']) ?>
                                    <?= __('price') ?> </div> -->

                                <div class="col-sm-4 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => 'doc_name']) ?> 
                                    <?= __('doc_name') ?> </div> 
                                
                                <!-- <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => 'doc_desc']) ?> 
                                    <?= __('doc_desc') ?> </div> -->

                                <!-- <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => ' doc_price ']) ?> 
                                    <?= __('doc_price ') ?> </div>
                                
                                <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => 'doc_currency', 'filter' => $this->Do->lcl($this->Do->get('currencies'))]) ?>
                                    <?= __('doc_currency') ?> </div> -->

                                    <!-- <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => ' 	doc_cpi ']) ?> 
                                    <?= __('doc_cpi') ?> </div>

                                    <div class="col-sm-1 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => 'doc_period']) ?>
                                    <?= __('doc_period') ?> </div> -->

                                <!-- <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => 'stat_created ']) ?>
                                    <?= __('stat_created ') ?> </div>

                                <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => ' 	stat_updated  ']) ?>
                                    <?= __(' 	stat_updated  ') ?> </div> -->

                                <!-- <div class="col-sm-2 col">
                                    <?= $this->element('colActions', ['url' => 'docs/index/', 'col' => 'rec_state']) ?>
                                    <?= __('rec_state') ?> </div> -->


                                <div class="col-sm-2 col hideMob"><span class="nobr"><?= __('action') ?></span>
                                </div>
                            </div>

                            <div class="grid_row row" ng-repeat="itm in lists.docs">

                                <div class="col-sm-2 hideMobSm grid_header">
                                    <label class="mycheckbox chkb">
                                        <input type="checkbox" ng-model="selected[itm.id]" ng-value="{{itm.id}}">
                                        <span></span> {{ itm.id }} <a href="<?= $app_folder ?>/admin/docs/index/{{itm.id}}"></a>
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

                                <div class="col-md-3 hideWeb grid_header"><?= __('docs_information') ?></div>
                                <div class=" col-md-2">
                                    <div style="color:black;">
                                        {{ itm.doc_name }}
                                    </div>                                   
                                    <div class="redtext">
                                    <!-- doc_period:{{itm.doc_period }} -->
                                    </div> 
                                    </div>
                                    
                                    <div class="col-md-2 hideWeb grid_header"><?= __('price') ?></div>
                                    <div class=" col-md-2">
                                    <div style="color:black;">
                                    {{ itm.doc_price }} {{DtSetter('currency', itm.doc_currency )}}
                                    </div>
                                    <div class="redtext">
                                    <!-- <span ng-bind-html="DtSetter('currency', itm.doc_currency )"></span> -->
                                        <!-- doc_currency: {{ itm.doc_currency }} -->
                                    </div>
                                    <!-- <div style="color:blue;">
                                        doc_cpi: {{ itm.doc_cpi }}
                                    </div> -->
                                </div>

                                <!-- <div class="col-4 hideWeb grid_header"><?= __('doc_name ') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('', itm.doc_name )"></div>

                                <div class="col-4 hideWeb grid_header"><?= __('doc_desc ') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('', itm.doc_desc )"></div>

                                <div class="col-4 hideWeb grid_header"><?= __('doc_price ') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('', itm.doc_price )"></div>

                                <div class="col-4 hideWeb grid_header"><?= __('doc_currency ') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('currency', itm.doc_currency )"></div>

                                <div class="col-4 hideWeb grid_header"><?= __('doc_cpi ') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('', itm.doc_cpi )"></div>

                                <div class="col-4 hideWeb grid_header"><?= __('doc_period ') ?></div>
                                <div class="col-md-1 col-8" ng-bind-html="DtSetter('', itm.doc_period )"></div> -->

                                <!-- <div class="col-4 hideWeb grid_header"><?= __('stat_created ') ?></div>
                                <div class="col-md-2 col-8">{{ itm.stat_created }} </div>

                                <div class="col-4 hideWeb grid_header"><?= __('stat_updated ') ?></div>
                                <div class="col-md-2 col-8">{{ itm.stat_updated }} </div> -->

                                <!-- <div class="col-2 hideWeb grid_header"><?= __('rec_state') ?></div>
                                <div class="col-md-2 col-8" ng-bind-html="DtSetter('rec_state', itm.rec_state)"></div> -->

                                <div class="col-4 hideWeb grid_header"><?= __('actions') ?></div>
                                <div class="col-md-2 col-8 action">
                                    <a href ng-click=" 
                                        doGet('/admin/docs?id='+itm.id, 'rec', 'doc');
                                        openModal('#viewDoc_mdl');
                                        "><i class="fa fa-eye"></i> <?= __('view') ?></a>
                                    <a href ng-click=" 
                                    doGet('/admin/docs?id='+itm.id, 'rec', 'doc');
                                        openModal('#addEditDoc_mdl');">
                                        <i class="fa fa-pencil"></i> <?= __('edit') ?>
                                    </a>
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

<?php echo $this->element('Modals/addEditDoc') ?>
<?php echo $this->element('Modals/viewDoc') ?>