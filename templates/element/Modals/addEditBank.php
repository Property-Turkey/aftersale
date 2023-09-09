<?php
    $parent_id = isset($this->request->getParam('pass')[0]) ? $this->request->getParam('pass')[0] : 0;
?>

<div class="modal fade" id="addEditBank_mdl" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<h4 ng-if="!rec.bank.id"><?= __('add') ?></h4>
					<h4 ng-if="rec.bank.id"><?= __('edit') ?></h4>
				</h4>
			</div>

			<div class="modal-body">
				<div class="x_content">

					<button ng-click="
							doGet('/admin/banks/index?list=1', 'list', 'banks');
							newEntity('bank');
						" id="bank_btn" class="hideIt"></button>

					<form class="form-label-left input_mask " id="bank_form" enctype="multipart/form-data" novalidate="novalidate" 
						ng-submit="doSave (rec.bank, 'bank', 'banks', '#bank_btn'); ">		
						
						<!-- <div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.bank.id">
							<h2><?= __('id') ?> : {{rec.bank.id}}</h2>
						</div> -->

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required ><?= __('bank_ownername') ?></label>
							<div class="div">
								<?= $this->Form->control('bank_ownername', [
									'type' => 'text',
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.bank.bank_ownername'
								]) ?>
								<span class="fa fa-user-circle form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required ><?= __('bank_name') ?></label>
							<div class="div">
								<?= $this->Form->control('bank_name ', [
									'type' => 'text',
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.bank.bank_name '
								]) ?>
								<span class="fa fa-bank form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required ><?= __('bank_number') ?></label>
							<div class="div">
								<?= $this->Form->control('bank_number', [
									'type' => 'text',
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.bank.bank_number',
									'only-numbers'=>'',
                                    'config' => "{group:'.',decimal:'.', decimalSize: 0,indentation:''}",
									'ng-pattern' => '/^\d{16}$/',
									'required' => ''									
								]) ?>
								<span class="fa fa-credit-card-alt form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<?php /*<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('bank_expiredate') ?></label>
							<div class="div">
								<?= $this->Form->text('bank_expiredate', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.bank.bank_expiredate',
									'only-numbers'=>'',
                                    'config' => "{group:'.',decimal:'.', decimalSize: 0,indentation:''}"
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div> 

						 <div class="col-md-6 col-6  form-group has-feedback">
							<label ><?= __('bank_cvv ') ?></label>
							<div class="div">
								<?= $this->Form->text('bank_cvv ', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.bank.bank_cvv' ,
									'only-numbers'=>'',
                                    'config' => "{group:'.',decimal:'.', decimalSize: 0,indentation:''}"
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div> */?>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('Bank Swift') ?></label>
							<div class="div">
								<?= $this->Form->text('bank_swift ', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.bank.bank_swift ',
									
									
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