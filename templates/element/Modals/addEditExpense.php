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

				<ul class="nav nav-tabs" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Expense</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#tabs-2"  ng-click="addDocument = 1">Document</a>
					</li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="x_content">
							<button ng-click="
						doGet('/admin/expenses/index?list=1', 'list', 'expenses');
						newEntity('expense');
					" id="expense_btn" class="hideIt"></button>

							<form class="form-label-left input_mask " id="expense_form" enctype="multipart/form-data" novalidate="novalidate" ng-submit="doSave (rec.expense, 'expense', 'expenses', '#expense_btn'); ">

								<!-- <div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.expense.id">
						<h2><?= __('id') ?> : {{rec.expense.id}}</h2>
					</div> -->
								<!-- <div class=" col-6 col-sm-6 col-md-6 ">
						<span class="icn">
							<a href data-toggle="modal" data-target="#docs_mdl" data-dismiss="modal" class="btn btn-info">
								<span class="fa fa-search"></span> <span class="hideMob"><?= __('document') ?></span>
							</a>
						</span>
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
										<span class="fa fa-qrcode form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<!-- <div class="col-md-6 col-6  form-group has-feedback">
						<label set-required><?= __('expense_amount') ?></label>
						<div class="div">
							<?= $this->Form->control('expense_amount ', [
								'type' => 'text',
								'label' => false,
								'class' => 'form-control has-feedback-left',
								'ng-model' => 'rec.expense.expense_amount ',
								'only-numbers' => '',
								'config' => "{group:'.',decimal:'.', decimalSize: 0,indentation:''}"
							]) ?>
							<span class="fa fa-money form-control-feedback left" aria-hidden="true"></span>
						</div>
					</div>

					<div class="col-md-6 col-6  form-group has-feedback">
						<label><?= __('expense_currency') ?></label>
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
					 -->
								<div class="row">
									<div class="col-md-12 form-group has-feedback">
										<label set-required><?= __('expense_amount') ?></label>
										<div class="input-group">
											<?= $this->Form->text('expense_currency', [
												'type' => 'select',
												'options' => ['' => 'Select'] + $this->Do->lcl($this->Do->get('currencies_icons')),
												'class' => 'form-control col-3',
												'ng-model' => 'rec.expense.expense_currency',
											]) ?>
											<?= $this->Form->text('expense_amount', [
												'type' => 'text',
												'class' => 'form-control col-9 has-feedback-left',
												'ng-model' => 'rec.expense.expense_amount',
												'only-numbers' => '',
											]) ?>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 form-group has-feedback">
									<label set-required ><?= __('Expense Category') ?></label>
									<div class="div">

										<!-- Client select input -->
										<select class="form-control has-feedback-left" ng-model="rec.expense.category_id" ng-change="onClientSelectionChange()">
											<option value="">Select Expense Category</option>
											<!-- <option value="add_client">Add Category</option> -->
											<?php foreach ($optionsExpenses as $key => $option) : ?>
												<option value="<?= $key ?>"><?= $option ?></option>
											<?php endforeach; ?>
										</select>
										<span class="fa fa-object-group form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-6 col-6  form-group has-feedback">
									<label set-required><?= __('owner_id') ?></label>
									<div class="div">
										<?= $this->Form->control('owner_id ', [
											'type' => 'select',
											'options' => $owners,
											'label' => false,
											'class' => 'form-control has-feedback-left',
											'ng-model' => 'rec.expense.owner_id ',
											'required' => 'required',

										]) ?>
										<span class="fa fa-user-circle-o form-control-feedback left" aria-hidden="true"></span>
										<!-- <button ng-click="doClick" class="onfly_btn"><i class="fa fa-search"></i></button> -->
									</div>
								</div>
								<div class="col-md-12 col-12  form-group has-feedback">
									<label><?= __('expense_description') ?></label>
									<div class="div">
										<?= $this->Form->control('expense_description ', [
											'label' => false,
											'type' => 'textarea',
											'class' => 'form-control has-feedback-left',
											'ng-model' => 'rec.expense.expense_description ',

										]) ?>
										<span class="fa fa-file-word-o form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<!-- <div class="clearfix"></div>

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
					</div> -->
								<div class="clearfix"></div>
								<div class="form-group ">
									<div class="col-md-12 col-sm-6  form-group has-feedback ">
										<button type="submit" ng-click="rec.category.parent_id = 10; " class="btn btn-info"><span><i class="fa fa-save"></i></span> <?= __('save') ?></button>
									</div>
								</div>

							</form>

						</div>
					</div>
					<div class="tab-pane" id="tabs-2" role="tabpanel">
						<?php
						$ctrl = strtolower($this->request->getParam('controller'));
						$ctrls = ['expenses' => 'expense', 'services' => 'service', 'owners' => 'owner', 'tenants' => 'tenant'];
						$tar_tbls = ['expenses' => '2', 'services' => '1', 'owners' => '3', 'tenants' => '4'];
						$isDocs = in_array($authUser['user_role'], ['admin.root', 'admin.admin', 'admin.supervisor', 'admin.portfolio']);
						?>
						<?php if ($isDocs) { ?>
							<div>
								<div class="row">
									<div class="col-6 col-lg-6">							
									</div>
									<!-- <div class="col-6 col-lg-6 text-right">
										<button class="btn btn-primary" type="button" ng-click="addDocument = addDocument == 1 ? 0 : 1">
											<i class="fa fa-plus"></i> <span class="hideMob"><?= __('Upload File') ?></span>
										</button>
									</div>
								</div> -->
								
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

									<div class="row ngif" ng-if="addDocument == 1">
										<div class="col-md-8 col-sm-8 form-group has-feedback">
											<!-- <label><?= __('doc_allowed_roles') ?></label> -->
											<div class="div">
												<label ng-repeat="role in adminRoles">
													<input type="checkbox" ng-model="rec.doc.doc_allowed_roles[role.value]"> {{ role.label }}
												</label>
											</div>
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
											<span></span> <i class="fa fa-save"></i> <?= __('Upload and Save') ?>
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
		</div>
	</div>
</div>
</div>