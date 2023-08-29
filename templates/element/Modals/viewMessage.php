<div class="modal fade" id="viewMessage_mdl" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">
                    <?= __('view_message') ?>
                </h4>
            </div>

            <div class="modal-body row">
                <div class="col-md-12 col-sm-12">
                    <div class="view_page">
                        <div class="grid">

                            <div class="grid_row row">
                                <h4 class="col-12">
                                    <i class="fa {{itm.message_configs.icon||'fa-tag'}}"></i> {{ rec.message.message_name }}
                                </h4>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('tenant_id')?></div>
                                <div class="col-md-9 notwrapped">{{ rec.tenant_id.id }}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('property_id')?></div>
                                <div class="col-md-9 notwrapped">{{ rec.property_id.id }}</div>
                            </div>
                            
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('message_price')?></div>
                                <div class="col-md-9 notwrapped">{{ rec.message_price.id }}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('message_vat')?></div>
                                <div class="col-md-9 notwrapped">{{ rec.message_vat.id }}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('message_tax')?></div>
                                <div class="col-md-9 notwrapped">{{ rec.message_tax.id }}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('message_contract_period')?></div>
                                <div class="col-md-9 notwrapped">{{ rec.message_contract_period.id }}</div>
                            </div>
                            
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('message_desc')?></div>
                                <div class="col-md-9 notwrapped">{{rec.message.message_desc}}</div>
                            </div>
                            
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('rec_state')?></div>
                                <div class="col-md-9 notwrapped" ng-bind-html="DtSetter( 'bool2', rec.message.rec_state )"></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>