<?php
$parent_id = isset($this->request->getParam("pass")[0])
	? $this->request->getParam("pass")[0]
	: 0; ?>

<div class="modal fade" id="addEditExpense_mdl" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<h4 ng-if="!rec.expense.id"><?= __("add") ?></h4>
					<h4 ng-if="rec.expense.id"><?= __("edit") ?></h4>
				</h4>
			</div>

			<div class="modal-body">

				<ul class="nav nav-tabs col-md-12" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Expenses</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#tabs-2" ng-click="addDocument = 1">Document</a>
					</li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="x_content">
							<button ng-click="
									doGet('/admin/expenses/index?list=1', 'list', 'expenses');
									newEntity('expense');" id="expense_btn" class="hideIt"></button>
							<form class="form-label-left input_mask " id="expense_form" enctype="multipart/form-data" novalidate="novalidate" ng-submit="doSave(rec.expense, 'expense', 'expenses', '#expense_btn'); ">

								<div class="col-md-6 col-6  form-group has-feedback">
									<label set-required><?= __("expense_type") ?></label>
									<div class="div">
										<?= $this->Form->control("expense_type", [
											"type" => "select",
											"label" => false,
											"options" => $this->Do->lcl($this->Do->get("expense_type")),
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.expense.expense_type",
										]) ?>
										<span class="fa fa-qrcode form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12 form-group has-feedback">
										<label set-required><?= __("expense_amount") ?></label>
										<div class="input-group">
											<?= $this->Form->text("expense_currency", [
												"type" => "select",
												"options" =>
												["" => "Select"] +
													$this->Do->lcl($this->Do->get("currencies_icons")),
												"class" => "form-control col-3",
												"ng-model" => "rec.expense.expense_currency",
											]) ?>
											<?= $this->Form->text("expense_amount", [
												"type" => "text",
												"class" => "form-control col-9 ",
												"ng-model" => "rec.expense.expense_amount",
												"only-numbers" => "",
											]) ?>
										</div>
									</div>
								</div>
								<div class="col-md-6 col-sm-6 form-group has-feedback">
									<label set-required><?= __("Expense Category") ?></label>
									<div class="div">

										<!-- Client select input -->
										<select class="form-control has-feedback-left" ng-model="rec.expense.category_id" ng-change="onClientSelectionChange()">
											<option value="">Select Expense Category</option>
											<?php foreach ($optionsExpenses as $key => $option) : ?>
												<option value="<?= $key ?>"><?= $option ?></option>
											<?php endforeach; ?>
										</select>
										<span class="fa fa-object-group form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-6 col-6  form-group has-feedback">
									<label set-required><?= __("owner_id") ?></label>
									<div class="div">
										<?= $this->Form->control("owner_id ", [
											"type" => "select",
											"options" => $owners,
											"label" => false,
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.expense.owner_id ",
											"required" => "required",
										]) ?>
										<span class="fa fa-user-circle-o form-control-feedback left" aria-hidden="true"></span>
										<!-- <button ng-click="doClick" class="onfly_btn"><i class="fa fa-search"></i></button> -->
									</div>
								</div>
								<div class="col-md-12 col-12  form-group has-feedback">
									<label><?= __("expense_description") ?></label>
									<div class="div">
										<?= $this->Form->control("expense_description ", [
											"label" => false,
											"type" => "textarea",
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.expense.expense_description ",
										]) ?>
										<span class="fa fa-file-word-o form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="form-group ">
									<div class="col-md-12 col-sm-6  form-group has-feedback ">
										<button type="submit" class="btn btn-info"><span><i class="fa fa-save"></i></span> <?= __("save") ?></button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="tab-pane" id="tabs-2" role="tabpanel">
						<?php
						$ctrl = strtolower($this->request->getParam("controller"));
						$ctrls = [
							"expenses" => "expense",
							"services" => "service",
							"owners" => "owner",
							"tenants" => "tenant",
						];
						$tar_tbls = [
							"expenses" => "2",
							"services" => "1",
							"owners" => "3",
							"tenants" => "4",
						];

						$isDocs = in_array($authUser["user_role"], [
							"admin.root",
							"admin.admin",
							"admin.supervisor",
							"admin.portfolio",
						]);
						?>
						<?php if ($isDocs) { ?>
							<div>

								<div class="row ngif" ng-if="addDocument == 1">
									<div class="row p-4">
										<div class="col-lg-12 col-sm-12 form-group has-feedback">
											<label class="mb-3"><?= __("doc_allowed_roles") ?></label>
											<div class="div d-flex pr-3">

												<label class="pr-3" ng-repeat="role in DtSetter('AdminRoles', 'list')">
													<input type="checkbox" ng-model="rec.doc.doc_allowed_roles[role]" value="role">{{role}}
												</label>
											</div>
										</div>
									</div>


									<div class="col-lg-12 col-sm-12  form-group has-feedback" ng-if="!(rec.doc.id > 0)">
										<label><?= __("doc_file") ?></label>
										<div class="div">

											<?= $this->Form->control("doc_file", [
												"class" => "form-control",
												"type" => "file",
												"file-model" => "files.doc_file",
												"ng-model" => "rec.doc.doc_file",
												"multiple" => false,
												"label" => false,
												"accept" => ".pdf,.doc,.docx",
											]) ?>

										</div>
									</div>
									<div class="col-md-12 col-sm-12  form-group has-feedback">
										<label><?= __("doc_desc") ?></label>
										<div class="div">
											<?= $this->Form->control("doc_desc", [
												"class" => "form-control has-feedback-left",
												"label" => false,
												"type" => "textarea",
												"rows" => "1",
												"ng-model" => "rec.doc.doc_desc",
											]) ?>
											<span class="fa fa-info-circle form-control-feedback left" aria-hidden="true"></span>
										</div>
									</div>
									<div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.doc.id">
										<label><?= __("Document Name") ?></label>
										<div class="div">
											<?= $this->Form->control("doc_name", [
												"class" => "form-control has-feedback-left",
												"label" => false,
												"type" => "text",
												"rows" => "1",
												"ng-model" => "rec.doc.doc_name",
											]) ?>
											<span class="fa fa-info-circle form-control-feedback left" aria-hidden="true"></span>
										</div>
									</div>
									<div class="clearfix"></div>
									<!-- 
									<div class="col-md-12 col-12 ">
										<button type="button" ng-click="
                                		rec.doc.file = filesInfo.doc_file;
                                		rec.doc.tar_id = rec.<?= $lastExpenseId ?>;													
                                        rec.doc.tar_tbl = '<?= $tar_tbls[$ctrl] ?>';
                                        rec.doc.tar_tbl_name = '<?= $ctrl ?>';
                                        doSave(rec.doc, 'doc', 'docs', '#<?= $ctrls[$ctrl] ?>_btn', '#doc_preloader');
    									" id="doc_preloader" class="btn btn-info">
											<span></span> <i class="fa fa-save"></i> <?= __("Upload and Save") ?>
										</button> -->

									<div class="col-md-12 col-12 ">
										<button type="button" ng-click="
                                		rec.doc.file = filesInfo.doc_file;
                                		rec.doc.tar_id = rec.<?= $ctrls[$ctrl] ?>.id;													
                                        rec.doc.tar_tbl = '<?= $tar_tbls[$ctrl] ?>';
                                        rec.doc.tar_tbl_name = '<?= $ctrl ?>';
                                        doSave(rec.doc, 'doc', 'docs', '#<?= $ctrls[$ctrl] ?>_btn', '#doc_preloader');
    									" id="doc_preloader" class="btn btn-info">
											<span></span> <i class="fa fa-save"></i> <?= __("Upload and Save") ?>
										</button>
										<button type="button" ng-if="rec.doc.id" ng-click="newEntity('doc');" class="btn btn-primary">
											<i class="fa fa-times"></i>
										</button>
									</div>
								</div>

								<?php
								// show files list
								?>
								<div class="grid">
									<div class="grid_row  row" ng-repeat="itm in rec.expense.docs">
										<div class="col-8">
											<div class="col-md-9 notwrapped">Document name:{{itm.doc_name}}</div>
											<div class="col-md-9 notwrapped">Document allowed Roles: {{itm.doc_allowed_roles}}</div>
											<div class="col-md-9 notwrapped">Document description: {{itm.doc_desc}}</div>
										</div>
										<div class="col-4 d-flex align-items-center">
											
							<a href ng-click="rec.doc=itm;doGet('/admin/docs?id='+itm.id, 'rec', 'doc');" class="inline-btn"><i class="fa fa-pencil"></i> <?= __('edit') ?> </a>
							<a href ng-click="doDelete('/admin/docs/delete/'+itm.id,'#<?= $ctrl ?>_btn');" class="inline-btn"> <i class="fa fa-trash"></i> <?= __('Delete') ?> </a>
										</div>
									</div>
								</div>
							</div>
					</div>
				<?php } else { ?>

				<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>