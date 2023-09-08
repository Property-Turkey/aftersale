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
                        <a class="nav-link" data-toggle="tab" href="#tab3">Inspect</a>
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
                                <div class="col-md-9 notwrapped">{{ rec.service.property.property_ref}}</div>
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
                                <div class="col-md-9 notwrapped">{{itm.doc_name}}</div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab3">
                        <div class="grid">
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('user_id') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.inspect.user.user_fullname}}</div>
                            </div>
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('inspect_desc') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.inspect.inspect_desc}}</div>
                            </div>
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('inspect_rate') ?></div>
                                <!-- <div class="col-md-6 col-6 form-group has-feedback"> -->
                                <div class="div">
                                    <?php
                                    foreach ($this->Do->cat(21) as $key => $rate) : ?>
                                        <div class="col-md-2 col-2 form-group has-feedback">
                                            <label><?= $rate ?>
                                                <div class="div">
                                                    <?php
                                                    $isChecked = false;
                                                    if (isset($jsonData[$rate]) && $jsonData[$rate] == '1') {
                                                        $isChecked = true;
                                                    } ?>
                                                    <input type="checkbox" id="<?= $key ?>" ng-model="rec.inspect.inspect_rate['<?= $rate ?>']" value="1" <?php if ($isChecked) echo "checked"; ?>>
                                            </label>
                                        </div>
                                </div>
                            <?php endforeach; ?>
                            </div>
                        </div>
                        <div class="grid_row row">
                            <div class="col-md-3 grid_header2"><?= __('stat_created') ?></div>
                            <div class="col-md-9 notwrapped">{{rec.inspect.stat_created}}</div>
                        </div>

                        <div class="grid_row row">
                            <div class="col-md-3 grid_header2"><?= __('rec_state') ?></div>
                            <div class="col-md-9 notwrapped" ng-bind-html="DtSetter( 'bool2', rec.inspect.rec_state )"></div>
                        </div>
                    </div>
                </div>