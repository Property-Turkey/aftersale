<div class="modal fade" id="viewService_mdl" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">
                    <?= __('view_service') ?>
                </h4>
            </div>

            <div class="modal-body row">
                <div class="col-md-12 col-sm-12">
                    <div class="view_page">
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
                                <div class="col-md-3 grid_header2"><?= __('property_ref ') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.service.property.property_ref }}</div>
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
                                <div class="col-md-9 notwrapped">{{DtSetter('currencies_icons', rec.service.service_currency)}} {{ rec.service.service_price }} </div></div>
                            </div>
                            
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('service_contract_period') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.service.service_contract_period}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('expiration_date') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.expiration_date}}</div>
                            </div>
                            
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('stat_created') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.service.stat_created}}</div>
                            </div>
          
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('service_desc') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.service.service_desc}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('rec_state') ?></div>
                                <div class="col-md-9 notwrapped" ng-bind-html="DtSetter( 'bool2', rec.service.rec_state )"></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>