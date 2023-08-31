<?php
$ctrl = strtolower($this->request->getParam('controller'));
$ctrls = ['expenses' => 'expense', 'services' => 'service', 'owners' => 'owner', 'tenants' => 'tenant'];
$tar_tbls = ['expenses' => '2', 'services' => '1', 'owners' => '3', 'tenants' => '4'];
$isDocs = in_array($authUser['user_role'], ['admin.root', 'admin.admin', 'admin.supervisor', 'admin.portfolio']);
?>




<div class="modal fade" id="docs_mdl" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">
                    <h4 ng-if="!rec.package.id"><?= __('add') ?></h4>
                    <h4 ng-if="rec.package.id"><?= __('edit') ?></h4>
                </h4>
            </div>


            <div class="modal-body">
                <?php if ($isDocs) { ?>
                    <div>
                        <div class="row">
                            <div class="col-6 col-lg-6">
                                <h4> </h4>
                            </div>
                            <div class="col-6 col-lg-6 text-right">
                                <button class="btn btn-primary" type="button" ng-click="addDocument = addDocument == 1 ? 0 : 1">
                                    <i class="fa fa-plus"></i> <span class="hideMob"><?= __('upload_file') ?></span>
                                </button>
                            </div>
                        </div>
               
                         <div class="row ngif" ng-if="addDocument == 1">
                            <div class="col-md-8 col-sm-8  form-group has-feedback">
                                <label><?= __('doc_allowed_roles') ?></label>
                                <div class="div">
                                    <?= $this->Form->control('doc_allowed_roles', [
                                        'class' => 'form-control selectpicker',
                                        'type' => 'select',
                                        'ng-model' => 'rec.doc.doc_allowed_roles',
                                        // 'data-live-search' => false,
                                        'multiple' => true,
                                        // 'multi-select' => '1',
                                        'label' => false,
                                        'data-size' => 6,
                                        'data-done-button' => false,
                                        'options' => $this->Do->lcl($this->Do->get('AdminRoles'), false, false)
                                    ]) ?>
                                </div>
                            </div> 
                                                       
                            <div class="col-lg-12 col-sm-12  form-group has-feedback" ng-if="!(rec.doc.id > 0)">
                                <label><?= __('doc_file') ?></label>
                                <div class="div">

                                    <?= $this->Form->control('doc_file', [
                                        'class' => 'form-control',
                                        'type' => 'file',
                                        'file-model' => 'files.doc_file',
                                        'ng-model' => 'rec.doc.doc_file',
                                        'multiple' => false,
                                        'label' => false,
                                        'accept' => '.pdf,.doc,.docx',
                                    ]) ?>

                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12  form-group has-feedback">
                                <label><?= __('doc_desc') ?></label>
                                <div class="div">
                                    <?= $this->Form->control('doc_desc', [
                                        'class' => 'form-control has-feedback-left',
                                        'label' => false,
                                        'type' => 'textarea',
                                        'rows' => '1',
                                        'ng-model' => 'rec.doc.doc_desc',
                                    ]) ?>
                                    <span class="fa fa-info-circle form-control-feedback left" aria-hidden="true"></span>
                                </div>
                            </div>

                            <div class="clearfix"></div>

                            <div class="col-md-12 col-12 ">
                                <button type="button" ng-click="
                                        rec.doc.file = filesInfo.doc_file;
                                        rec.doc.tar_id = rec.<?= $ctrls[$ctrl] ?>.id;
                                        rec.doc.tar_tbl = '<?= $tar_tbls[$ctrl] ?>';
                                        rec.doc.tar_tbl_name = '<?= $ctrl ?>';
                                        doSave(rec.doc, 'doc', 'docs', '#<?= $ctrls[$ctrl] ?>_btn', '#doc_preloader');
                                    " id="doc_preloader" class="btn btn-info">
                                    <span></span> <i class="fa fa-save"></i> <?= __('upload_and_save') ?>
                                </button>

                                <button type="button" ng-if="rec.doc.id" ng-click="newEntity('doc');" class="btn btn-primary">
                                    <i class="fa fa-times"></i>
                                </button>
                            </div>

                        </div>


                        <?php // show files list 
                        ?>
                        <div class="grid_row row" ng-repeat="doc in rec.<?= $ctrl ?>.docs">
                            <div class="col-5 grid_header2">
                                {{doc.doc_name}}
                            </div>
                            <div class="col-7 notwrapped text-right">
                                <a class="small-btn" target="_blank" href="<?= $protocol . ':' . $path ?>/file/<?= $ctrls ?>_files/{{ doc.doc_name }}"><i class="fa fa-eye"></i></a>
                                <a class="small-btn" href ng-click="rec.doc = doc; $parent.addDocument=1;"><i class="fa fa-edit"></i></a>
                                <a class="small-btn" href ng-click="doDelete('/admin/docs/delete/'+doc.id, '#<?= $ctrl ?>_btn');"><i class="fa fa-trash"></i></a>
                            </div>
                        </div>
                    <?php } else { ?>

                        <div class="col-12 not_found_div"><i class="fa fa-info-circle"></i> <?= __('available_only_for_admins') ?></div>

                    <?php } ?>

                    </div>
            </div>
        </div>
    </div>