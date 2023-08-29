<div class="modal fade" id="viewPackage_mdl" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">
                    <?= __('view_package') ?>
                </h4>
            </div>

            <div class="modal-body row">
                <div class="col-md-12 col-sm-12">
                    <div class="view_page">
                        <div class="grid">

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('package_name') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.package.package_name}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('package_desc') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.package.package_desc}}</div>
                            </div>

                            <!-- <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('package_price') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.package.package_price}} {{DtSetter( 'currency', rec.package.package_currency )}}</div>
                            </div> -->

                            <!-- <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('package_currency') ?></div>
                                <div class="col-md-9 notwrapped" ng-bind-html="DtSetter( 'currency', rec.package.package_currency )"></div>
                            </div> -->
<!-- 
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('package_period') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.package.package_period}}</div>
                            </div> -->
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('package_cpi') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.package.package_cpi}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('stat_created') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.package.stat_created}}</div>
                            </div>
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('stat_updated') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.package.stat_updated}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('rec_state') ?></div>
                                <div class="col-md-9 notwrapped" ng-bind-html="DtSetter( 'bool2', rec.package.rec_state )"></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>