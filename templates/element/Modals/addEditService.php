<?php
$parent_id = isset($this->request->getParam("pass")[0])
	? $this->request->getParam("pass")[0]
	: 0; ?>

<div class="modal fade" id="addEditService_mdl" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<h4 ng-if="!rec.service.id"><?= __("add") ?></h4>
					<h4 ng-if="rec.service.id"><?= __("edit") ?></h4>
				</h4>
			</div>
			<div class="modal-body">

				<ul class="nav nav-tabs col-md-12" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Services</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#tabs-2" ng-click="addDocument = 1">Document</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#t3">Inspect</a>
					</li>

				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="x_content">
							<button ng-click="
							doGet('/admin/services/index?list=1', 'list', 'services');
							newEntity('service');
						" id="service_btn" class="hideIt"></button>

							<form class="form-label-left input_mask " id="service_form" enctype="multipart/form-data" novalidate="novalidate" ng-submit="doSave(rec.service, 'service', 'services', '#service_btn'); ">

								<div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.service.parent_name">
									<h2><?= __("user_id") ?> : {{rec.service.user_id}}</h2>
								</div>
								<div class="col-md-6 col-sm-6 form-group has-feedback">
									<label set-required><?= __("owner_id") ?></label>
									<div class="div">
										<!-- Client select input -->
										<select class="form-control has-feedback-left" ng-model="rec.service.owner_id" ng-change="onClientSelectionChange()">
											<option value="">Select Owner</option>
											<option value="add_client">Add New Owner</option>
											<option ng-repeat="(ownerId, ownerName) in DtSetter('ownerList', 'list')" value="{{ownerId}}">{{ownerName}}</option>
										</select>
										<span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-6 col-6  form-group has-feedback">
									<label><?= __("tenant_id") ?></label>
									<div class="div">
										<?= $this->Form->control("tenant_id", [
											"type" => "select",
											"options" => $tenants,
											"label" => false,
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.service.tenant_id",
										]) ?>
										<span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-6 col-6  form-group has-feedback">
									<label set-required><?= __("service_vat") ?></label>
									<div class="div">
										<?= $this->Form->text("service_vat", [
											"type" => "text",
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.service.service_vat",
											"oninput" =>
											'this.value = this.value.replace(/[^0-9]/g, "").substring(0, 2)',
										]) ?>
										<span class="fa fa-percent form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-6 col-6  form-group has-feedback">
									<label set-required><?= __("service_tax") ?></label>
									<div class="div">
										<?= $this->Form->text("service_tax", [
											"type" => "text",
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.service.service_tax",
											"oninput" =>
											'this.value = this.value.replace(/[^0-9]/g, "").substring(0, 2)',
										]) ?>
										<span class="fa fa-percent form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-6 col-6  form-group has-feedback">
									<label set-required><?= __("service_contract_period") ?> <span style="color: red; font-weight: bold; font-size:11px">(This field contains day)</span></label>
									<div class="div">
										<?= $this->Form->text("service_contract_period", [
											"type" => "text",
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.service.service_contract_period",
											"only-numbers" => "",

										]) ?>
										<span class="fa fa-calendar form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="row ">
									<div class="col-md-12 form-group has-feedback">
										<label set-required><?= __("service_price") ?></label>
										<div class="input-group">
											<?= $this->Form->text("service_currency", [
												"type" => "select",
												"options" =>	["" => "Select"] + $this->Do->lcl($this->Do->get("currencies_icons")),
												"class" => "form-control col-3",
												"ng-model" => "rec.service.service_currency",
											]) ?>
											<?= $this->Form->text("service_price", [
												"type" => "text",
												"class" => "form-control col-9",
												"ng-model" => "rec.service.service_price",
												"only-numbers" => "",
											]) ?>
										</div>
									</div>
								</div>

								<div class="col-md-6 col-sm-6 form-group has-feedback">
									<label><?= __('property_ref') ?></label>
									<div class="div">
										<tags-input display-property="text" key-property="value" ng-model="rec.service.property" max-tags="1" add-from-autocomplete-only="true" ng-disabled="rec.service.property || rec.service.id">
											<auto-complete source="loadTags($query,'services')"></auto-complete>
										</tags-input>
										<span ng-if="rec.service.property || rec.service.id" ng-click="rec.service.property = ''; rec.service.id = undefined;" class="fa fa-times" style="cursor: pointer; position: absolute; top: 50%; right: 10px; transform: translateY(-50%);"></span>
									</div>
								</div>
								<div class="col-md-6 col-6  form-group has-feedback">
									<label set-required><?= __("package_id") ?></label>
									<div class="div">
										<?= $this->Form->text("package_id", [
											"type" => "select",
											"options" => $packages,
											//'options' => $this->Do->lcl($this->Do->get('package_currency')),
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.service.package_id",
										]) ?>
										<span class="fa fa-info form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>
								<div class="col-md-12 col-12  form-group has-feedback">
									<label><?= __("service_desc") ?></label>
									<div class="div">
										<?= $this->Form->text("service_desc", [
											"type" => "textarea",
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.service.service_desc",
										]) ?>
										<span class="fa fa-language form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="clearfix"></div>
								<div class="form-group ">
									<div class="col-md-12 col-sm-6  form-group has-feedback ">
										<button type="submit" class="btn btn-info"><span><i class="fa fa-save"></i></span> <?= __("save") ?></button>
									</div>
								</div>
							</form>
							<button type="button" id="user_btn" class="hideIt" ng-click="
								doGet('/admin/users/index?list=1', 'list', 'users');
								rec.user.id>0 ? '' : rec.user = {};
								doClick('.close');
							"></button>
							<form class="row" id="user_form" ng-show="showAddClientForm" ng-submit="
									rec.user.user_role = 'user.owner';
									doSave(rec.user, 'user', 'users', '#user_btn', '#user_preloader');">
								<div class="col-md-6 col-sm-6  form-group has-feedback">
									<label set-required><?= __("user_fullname") ?></label>
									<div class="div">
										<?= $this->Form->control("user_fullname", [
											"class" => "form-control has-feedback-left",
											"label" => false,
											"type" => "text",
											"ng-model" => "rec.user.user_fullname",
											"placeholder" => __("user_fullname"),
										]) ?>
										<span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-6 col-sm-6  form-group has-feedback">
									<label set-required><?= __("email") ?></label>
									<div class="div">
										<?= $this->Form->control("email", [
											"class" => "form-control has-feedback-left",
											"label" => false,
											"type" => "email",
											"ng-model" => "rec.user.email",
											"placeholder" => __("email"),
										]) ?>
										<span class="fa fa-at form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-12 col-sm-12 mb-2 mt-2"> </div>
								<div class="col-md-6 col-sm-6  form-group has-feedback">
									<label><?= __("mobile") ?></label>
									<div class="div">
										<?= $this->Form->control("user_configs[mobile]", [
											"class" => "form-control has-feedback-left",
											"label" => false,
											"type" => "tel",
											"only-numbers" => "",
											"ng-model" => "rec.user.user_configs.mobile",
											"placeholder" => __("mobile"),
										]) ?>
										<span class="fa fa-mobile form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-12 col-sm-12  form-group has-feedback">
									<label><?= __("address") ?></label>
									<div class="div">
										<?= $this->Form->control("user_configs[address]", [
											"class" => "form-control has-feedback-left",
											"label" => false,
											"type" => "textarea",
											"ng-model" => "rec.user.user_configs.address",
											"placeholder" => __("address"),
										]) ?>
										<span class="fa fa-map-marker form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>
								<!-- 
								 <?php if (
										in_array($authUser["user_role"], [
											"admin.root",
											"user.tenant",
											"user.owner",
										])
									) { ?>
							<div class="col-md-6 col-sm-6  form-group has-feedback">
								<label set-required><?= __("user_role") ?></label>
								<div class="div">
									<?= $this->Form->control("user_role", [
											"class" => "form-control has-feedback-left",
											"label" => false,
											"type" => "select",
											"ng-model" => "rec.user.user.owner",
											//'value'=>'user.owner',
											//'options' =>  ['user.owner' => __('user.owner')],
											//'empty' => __('user.owner'),
										]) ?>
									<span class="fa fa-flash form-control-feedback left" aria-hidden="true"></span>
								</div>
							</div>							
						<?php } ?>					 -->
								<div class="clearfix"></div>
								<div class="col-md-12 col-sm-12  form-group has-feedback ">
									<button type="submit" class="btn btn-info" id="user_preloader"><span></span> <i class="fa fa-save"></i> <?= __("save") ?></button>
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
													<input type="checkbox" ng-model="rec.doc.doc_allowed_roles[role]" value="role"> {{role}}
												</label>
											</div>
										</div>
									</div>

									<div class="col-lg-12 col-sm-12  form-group has-feedback" ng-if="!(rec.doc.id > 0)">
										<label ><?= __("doc_file") ?></label>
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

								?>
								<!-- // show files list -->

								<div class="grid">
									<div class="grid_row  row" ng-repeat="itm in rec.service.docs">
										<div class="col-8">
											<div class="col-md-9 notwrapped">Document Name: {{itm.doc_name}}</div>
											<div class="col-md-9 notwrapped">Document Allowed Roles: {{itm.doc_allowed_roles}}</div>
											<div class="col-md-9 notwrapped">Document Description: {{itm.doc_desc}}</div>
										</div>
										<div class="col-4 d-flex align-items-center">
											<a href ng-click="rec.doc=itm" class="inline-btn"><i class="fa fa-pencil"></i> <?= __('edit') ?> </a>
											<a href ng-click="doDelete('/admin/docs/delete/'+itm.id,'#<?= $ctrl ?>_btn');" class="inline-btn"> <i class="fa fa-trash"></i> <?= __('Delete') ?> </a>
										</div>
									</div>
								</div>
							<?php } else { ?>
							<?php } ?>
							</div>
					</div>
					<div class="tab-pane" id="t3">
						<div class="grid">
							<div class="x_content">
						<button ng-click="doGet('/admin/inspects/index?list=1', 'list', 'inspects');newEntity('inspect');" id="inspect_btn" class="hideIt"></button>
		<form class="form-label-left input_mask " id="inspect_form" enctype="multipart/form-data" novalidate="novalidate" ng-submit=" doSave (rec.inspect, 'inspect', 'inspects', '#inspect_btn'); ">

									<div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.inspect.parent_name">
										<h2><?= __('user_id') ?> : {{rec.inspect.user_id}}</h2>
									</div>

									<!-- <div class="col-md-6 col-6  form-group has-feedback">
										<label><?= __('user_id') ?> <span style="color: red; font-weight: bold; font-size:11px">(inspector)</span></label></label>
										<div class="div">
											<?= $this->Form->control('user_id', [
												'type' => 'select',
												'label' => false,
												'options' => $owners,
												'class' => 'form-control has-feedback-left',
												'ng-model' => 'rec.inspect.user_id'
											]) ?>
											<span class="fa fa-user-circle form-control-feedback left" aria-hidden="true"></span>
										</div>
									</div> -->

									<!-- <div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('owner_id') ?></label>
							<div class="div">
								<?= $this->Form->control('owner_id', [
									'type' => 'select',
									'label' => false,
									'options' => $owners,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.inspect.owner_id',
									'chk' => 'isNumber'
								]) ?>
								<span class="fa fa-navicon form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('propery_ref') ?></label>
							<div class="div">
								<?= $this->Form->control('property_id', [
									'type' => 'select',
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.inspect.property_id',
									'chk' => 'isNumber'
								]) ?>
								<span class="fa fa-navicon form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div> -->
									<div class="col-md-12 col-12  form-group has-feedback">
										<label><?= __('inspect_desc') ?></label>
										<div class="div">
											<?= $this->Form->control('inspect_desc', [
												'type' => 'textarea',
												'label' => false,
												'class' => 'form-control has-feedback-left',
												'ng-model' => 'rec.inspect.inspect_desc'
											]) ?>
											<span class="fa fa-sticky-note-o form-control-feedback left" aria-hidden="true"></span>
										</div>
									</div>
									<div class="col-md-12 col-12  form-group has-feedback">
										<label><?= __('inspect_rate') ?></label>
										<div class="div">

											<!-- Client select input -->
											<select class="form-control has-feedback-left" ng-model="rec.inspect.inspect_rate" ng-change="onClientSelectionChange()">
												<option value="">Select Inspect Rate</option>
												<option value="add_inspect">Add New Inspect Rate</option>
												<!-- <option ng-repeat="(ownerId, ownerName) in DtSetter('ownerList', 'list')" value="{{ownerId}}">{{ownerName}}</option> -->
											</select>
											<span class="fa fa-quote-left form-control-feedback left" aria-hidden="true"></span>
										</div>
									</div>

									<div class="col-md-6 col-6 form-group has-feedback">
										<div class="div">
											<?php
											foreach ($this->Do->cat(21) as $key => $rate) : ?>
												<div class="col-md-2 col-2 form-group has-feedback">
													<label><?= $rate ?>
														<div class="div">
															<?php
															$isChecked = false;
															if (isset($jsonData[$rate]) && $jsonData[$rate] == '1') {
																$isChecked = true;
															}
															?>
															<input type="checkbox" id="<?= $key ?>" ng-model="rec.inspect.inspect_rate['<?= $rate ?>']" value="1" <?php if ($isChecked) echo "checked"; ?>>
													</label>
												</div>
										</div>
									<?php endforeach; ?>
									</div>
							</div>
							<div>
							</div>
							<div class="clearfix"></div>
							<div class="form-group ">
								<div class="col-md-12 col-sm-12  form-group has-feedback ">
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
									<label><?= __('inspect_rate') ?></label>
									<div class="div">
										<?= $this->Form->control('category_name', [
											'type' => 'text',
											'label' => false,
											'class' => 'form-control has-feedback-left',
											'ng-model' => 'rec.category.category_name'
										]) ?>
										<span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="col-md-12 col-sm-12  form-group has-feedback ">
									<button type="submit" ng-click="rec.category.parent_id = 21; " class="btn btn-info"><span><i class="fa fa-save"></i></span> <?= __('save') ?></button>
								</div>
							</form>
						</div>
						<div class="grid">
							<div class="grid_row  row" ng-repeat="itm in rec.service.inspects">
								<div class="col-8">
									<div class="col-md-9 notwrapped"> Inspect Description :{{itm.inspect_desc}}</div>
									<div class="col-md-9 grid_header2">Inspect Rate:
										<div class="col-12" ng-repeat="(key, value) in itm.inspect_rate" ng-if="!$last">
											<div>
												<i class="fa fa-user"></i>{{ key }}&nbsp
											</div>
										</div>
										<div class="col-12" ng-repeat="(key, value) in itm.inspect_rate" ng-if="$last">
											<div>
												<i class="fa fa-map-marker"></i>{{ key }}
											</div>
										</div>
									</div>
								</div>
								<div class="col-4 d-flex align-items-center">
									<a href ng-click="rec.inspect=itm;doGet('/admin/inspects?id='+itm.id, 'rec', 'inspect');" class="inline-btn"><i class="fa fa-pencil"></i> <?= __('edit') ?> </a>
									<a href ng-click="doDelete('/admin/inspects/delete/'+itm.id,'#<?= $ctrl ?>_btn');" class="inline-btn"> <i class="fa fa-trash"></i> <?= __('Delete') ?> </a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>