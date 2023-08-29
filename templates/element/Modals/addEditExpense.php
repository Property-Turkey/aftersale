<?php
$parent_id = isset($this->request->getParam('pass')[0]) ? $this->request->getParam('pass')[0] : 0;
?>

<div class="modal fade" id="addEditExpense_mdl" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<h4 ng-if="!rec.expense.id"><?= __('add') ?></h4>
					<h4 ng-if="rec.expense.id"><?= __('edit') ?></h4>
				</h4>
			</div>

			<div class="modal-body">
				<div class="x_content">

					<button ng-click="
							doGet('/admin/expenses/index?list=1', 'list', 'expenses');
							newEntity('expense');
						" id="expense_btn" class="hideIt"></button>

					<form class="form-label-left input_mask " id="expense_form" enctype="multipart/form-data" novalidate="novalidate" ng-submit="doSave (rec.expense, 'expense', 'expenses', '#expense_btn'); ">

						<!-- <div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.expense.id">
							<h2><?= __('id') ?> : {{rec.expense.id}}</h2>
						</div> -->

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('expense_type') ?></label>
							<div class="div">
								<?= $this->Form->control('expense_type', [
									'type' => 'select',
									'label' => false,
									'options' => $this->Do->lcl($this->Do->get('expense_type')),
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.expense.expense_type'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('expense_amount ') ?></label>
							<div class="div">
								<?= $this->Form->control('expense_amount ', [
									'type' => 'text',
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.expense.expense_amount ',
									'only-numbers' => '',
									'config' => "{group:'.',decimal:'.', decimalSize: 0,indentation:''}"
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('expense_currency ') ?></label>
							<div class="div">
								<?= $this->Form->control('expense_currency ', [
									'type' => 'select',
									'label' => false,
									'options' => $this->Do->lcl($this->Do->get('currencies_icons')),
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.expense.expense_currency ',
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>
						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('expense_description ') ?></label>
							<div class="div">
								<?= $this->Form->control('expense_description ', [
									'label' => false,
									'type' => 'textarea',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.expense.expense_description ',

								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-sm-6 form-group has-feedback">
							<label><?= __('category_id') ?></label>
							<div class="div">

								<!-- Client select input -->
								<select class="form-control has-feedback-left" ng-model="rec.expense.category_id" ng-change="onClientSelectionChange()">
									<option value="">Select Category</option>
									<option value="add_client">Add Category</option>
									<?php foreach ($optionsExpenses as $key => $option) : ?>
										<option value="<?= $key ?>"><?= $option ?></option>
									<?php endforeach; ?>
								</select>
								<span class="fa fa-sale form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('owner_id ') ?></label>
							<div class="div">
								<?= $this->Form->control('owner_id ', [
									'type' => 'select',
									'options' => $owners,
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.expense.owner_id ',
									'required' => 'required',

								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
								<!-- <button ng-click="doClick" class="onfly_btn"><i class="fa fa-search"></i></button> -->
							</div>
						</div>

						<div class="clearfix"></div>

						<div class="form-group ">
							<div class="col-md-12 col-sm-6  form-group has-feedback ">
								<button type="submit" class="btn btn-info"><span><i class="fa fa-save"></i></span> <?= __('save') ?></button>
							</div>
						</div>
					</form>
					<button ng-click="
							doGet('/admin/categories/index?list=1', 'list', 'categories');
							newEntity('category');
						" id="category_btn" class="hideIt"></button>

					<form class="form-label-left input_mask " ng-show="showAddClientForm" id="category_form" enctype="multipart/form-data" novalidate="novalidate" ng-submit="doSave (rec.category, 'category', 'categories', '#category_btn'); ">

						<div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.category.parent_name">
							<h2><?= __('parent_id') ?> : {{rec.category.parent_name}}</h2>
						</div>

						<div class="col-md-12 col-sm-12  form-group has-feedback">
							<label><?= __('category_name') ?></label>
							<div class="div">
								<?= $this->Form->control('category_name', [
									'type' => 'text',
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.category.category_name'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>
						<div class="clearfix"></div>
						<div class="form-group ">
							<div class="col-md-12 col-sm-6  form-group has-feedback ">
								<button type="submit" ng-click="rec.category.parent_id = 10; " class="btn btn-info"><span><i class="fa fa-save"></i></span> <?= __('save') ?></button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>