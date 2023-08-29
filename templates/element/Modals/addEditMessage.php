<?php
    $parent_id = isset($this->request->getParam('pass')[0]) ? $this->request->getParam('pass')[0] : 0;
?>

<div class="modal fade" id="addEditMessage_mdl" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<h4 ng-if="!rec.message.id"><?= __('add') ?></h4>
					<h4 ng-if="rec.message.id"><?= __('edit') ?></h4>
				</h4>
			</div>

			<div class="modal-body">
				<div class="x_content">

					<button ng-click="
							doGet('/admin/messages/index?list=1', 'list', 'messages');
							newEntity('message');
						" id="message_btn" class="hideIt"></button>

					<form class="form-label-left input_mask " id="message_form" enctype="multipart/form-data" novalidate="novalidate" 
						ng-submit="doSave (rec.message, 'message', 'messages', '#message_btn'); ">

						<div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.message.parent_name">
							<h2><?= __('user_id') ?> : {{rec.message.user_id}}</h2>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('tenant_id') ?></label>
							<div class="div">
								<?= $this->Form->text('tenant_id', [
									'type' => 'select',
									'options'=>$this->Do->lcl( $this->Do->get('tenant_id') ),
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.message.tenant_id'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('property_id') ?></label>
							<div class="div">
								<?= $this->Form->text('property_id', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.message.property_id'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('message_desc') ?></label>
							<div class="div">
								<?= $this->Form->text('message_desc', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.message.message_desc'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>


						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('message_price') ?></label>
							<div class="div">
								<?= $this->Form->text('message_price', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.message.message_price',
									'chk' => 'isNumber' 
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('message_vat') ?></label>
							<div class="div">
								<?= $this->Form->text('message_vat', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.message.message_vat',
									'chk' => 'isNumber' 
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('message_tax') ?></label>
							<div class="div">
								<?= $this->Form->text('message_tax', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.message.message_tax',
									'chk' => 'isNumber' 
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						
						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('message_contract_period') ?></label>
							<div class="div">
								<?= $this->Form->text('message_contract_period', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.message.message_contract_period'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
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


