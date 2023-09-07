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
                                    <i class=""></i> {{ rec.message.message_name }}
                                </h4>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('message_to') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.message.user.user_fullname}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('message_subject') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.message.message_subject}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('message_text') ?></div>
                                <div class="col-md-9 notwrapped">{{ rec.message.message_text}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('message_priority') ?></div>
                                <div class="col-md-9 notwrapped"ng-bind-html="DtSetter( ' ', rec.message.message_priority)"></div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __('rec_state') ?></div>
                                <div class="col-md-9 notwrapped" ng-bind-html="DtSetter( 'bool2', rec.message.rec_state)"></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>