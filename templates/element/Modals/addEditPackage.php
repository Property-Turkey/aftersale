<?php
$parent_id = isset($this->request->getParam('pass')[0]) ? $this->request->getParam('pass')[0] : 0;
?>

<div class="modal fade" id="addEditPackage_mdl" tabindex="-1" role="dialog" aria-hidden="true">
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
				<div class="x_content">

					<button ng-click="
							doGet('/admin/packages/index?list=1', 'list', 'packages');
							newEntity('package');
						" id="package_btn" class="hideIt"></button>

					<form class="form-label-left input_mask " id="package_form" enctype="multipart/form-data" novalidate="novalidate" 
					ng-submit="doSave (rec.package, 'package', 'packages', '#package_btn'); ">

						<div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.package.parent_name">
							<h2><?= __('user_id') ?> : {{rec.package.user_id}}</h2>
						</div>
						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('package_name') ?></label>
							<div class="div">
								<?= $this->Form->control('package_name', [
									'type' => 'text',
									//'options'=>$packagename,
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.package.package_name'
								]) ?>
								<span class="fa fa-file-powerpoint-o form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('package_cpi') ?></label>
							<div class="div">
								<?= $this->Form->text('package_cpi', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.package.package_cpi'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>
						<div class="col-md-12 col-12  form-group has-feedback">
							<label><?= __('package_desc') ?></label>
							<div class="div">
								<?= $this->Form->control('package_desc', [
									'type' => 'textarea',
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.package.package_desc'
								]) ?>
								<span class="fa fa-audio-description form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="form-group ">
							<div class="col-md-12 col-sm-6  form-group has-feedback ">
								<button type="submit" class="btn btn-info"><span><i class="fa fa-save"></i></span> <?= __('save') ?></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>