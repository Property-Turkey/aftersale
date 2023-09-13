<div class="modal" id="viewService_mdl">
    <div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">
                    <?= __('view_service') ?>
                </h4>
            </div>

            <div class="modal-body row">
                <ul class="nav nav-tabs col-md-12" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tab2" ng-click="addDocument = 1">Document</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#ta3">Inspect</a>
                    </li>
                </ul>
                <div class="tab-content col-12">
                    <div class=" tab-pane active" id="tab1">

                        <div class="grid">
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('owner_id') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.service.owner.user_fullname }}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('tenant_id') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.service.tenant.user_fullname}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('property_ref') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.service.property[0]['text']}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('package_name') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.service.package.package_name}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('service_vat') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.service.service_vat }}%</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('service_tax') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.service.service_tax }}%</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('service_price') ?></div>
                                <div class="col-md-9 notwrapped">{{DtSetter('currencies_icons', rec.service.service_currency)}} {{ rec.service.service_price }} </div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('service_contract_period') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.service.service_contract_period}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('expiration_date') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.service.expiration_date}}</div>
                            </div>
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('stat_created') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.service.stat_created}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('service_desc') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.service.service_desc}}
                                    {{ rec.service.docs.doc_name}}
                                </div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('rec_state') ?></div>
                                <div class="col-md-9 notwrapped" ng-bind-html="DtSetter( 'bool2', rec.service.rec_state )"></div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab2">
                        <div class="grid">
                            <div class="grid_row row" ng-repeat="itm in rec.service.docs">
                                <!-- <div class="col-md-3 grid_header2"><?= __('document') ?></div> -->
                                <div class="col-md-9 notwrapped"><strong>Document Name:</strong>{{itm.doc_name}}</div>
                                <div class="col-md-9 notwrapped"><strong>Document Description:</strong> {{itm.doc_desc}}</div>
                                <div class="col-md-9 notwrapped">
                                    <strong style="float: left;">Document Allowed Roles:</strong>
                                    <div class="col-12" ng-repeat="(key, value) in itm.doc_allowed_roles" ng-if="!$last">
                                    <div class="col-12" ng-repeat="(key, value) in itm.doc_allowed_roles" ng-if="!$last">                          
                                                <span class="badge badge-warning">{{ key }}</span>&nbsp;                                                                                                     
                                                <span class="badge badge-warning">{{ key }}</span>
                                            </div>
                                        </div>
                                  
                                    <!-- <span class="badge badge-warning">{{itm.doc_allowed_roles}}</span> -->
                                </div>
                                <!-- <div class="col-md-9 notwrapped"><strong>Document Allowed Roles:</strong><span class="badge badge-warning">{{itm.doc_allowed_roles}}</span></div> -->
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="ta3">
                        <div class="grid">
                            <!-- <div class="grid_row row" ng-repeat="itm in rec.service.inspects">
                                <div class="col-md-3 grid_header2"><?= __('user_id') ?></div>
                                <div class="col-md-9 notwrapped">{{itm.user_fullname}}</div>
                            </div> -->


                            <!-- 
                            <div class="grid_row row" ng-repeat="itm in rec.service.inspects">
                                <div class="col-md-3 grid_header2"><?= __('inspect_rate') ?></div>
                                <div ng-repeat="(key, value) in itm.inspect_rate" ng-if="!$last">
                                    <div>{{ key }},</div>
                                </div>
                                <div ng-repeat="(key, value) in itm.inspect_rate" ng-if="$last">
                                    <div>{{ key }}</div>
                                </div>
                            </div> -->
                            <div class="grid_row row" ng-repeat="itm in rec.service.inspects">
                                <div class="col-md-9 notwrapped"><strong><?= __('inspect_desc') ?></strong><span>:{{itm.inspect_desc}}</span></div>
                                <div class="col-md-9 notwrapped"><strong><?= __('inspect_rate') ?></strong>
                                    <div class="col-12" ng-repeat="(key, value) in itm.inspect_rate" ng-if="!$last">
                                        <div>
                                            <i class="fa fa-navicon"></i> {{ key }}&nbsp
                                        </div>
                                    </div>
                                    <div class="col-12" ng-repeat="(key, value) in itm.inspect_rate" ng-if="$last">
                                        <div>
                                            <i class="fa fa-sticky-note-o"></i> {{ key }}
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-9 notwrapped"><strong><?= __('stat_created') ?></strong><span>:{{itm.stat_created}}</span></div>
                            </div>
                        </div>
                    </div>