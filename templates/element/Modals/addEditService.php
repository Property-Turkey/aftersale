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
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div class="tab-pane active" id="tabs-1" role="tabpanel">
						<div class="x_content">
							<button ng-click="
							doGet('/admin/services/index?list=1', 'list', 'services');
							newEntity('service');
						" id="service_btn" class="hideIt"></button>

							<form class="form-label-left input_mask " id="service_form" enctype="multipart/form-data" novalidate="novalidate" ng-submit="doSave (rec.service, 'service', 'services', '#service_btn'); ">

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

								<?php /* <div class="col-md-6 col-6  form-group has-feedback">
							<label set-required ><?= __("property_id") ?></label>
							<div class="div">
							<?= $this->element("colActions", [
								"url" => "services/index/",
								"col" => "property_id",
								"search" => "property_id",
							]) ?> 									
							</div>
						</div> 
								 <div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __("package_name") ?></label>
							<div class="div">
								<?= $this->Form->text("package_name", [
									"type" => "select",
									"options" => $packages,
									"label" => false,
									"class" => "form-control has-feedback-left",
									"ng-model" => "rec.service.package_name",
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div> 

								</div>
                                <div class="col-md-6 col-6 form-group has-feedback">
									<label><?= __("package_id") ?></label>
									<div class="div">
										<label class="radio-inline" ng-repeat="(key, package) in DtSetter('packages', 'list') track by $index">
											<input type="checkbox" ng-model="rec.service.servicePackageObj[$index].package_id" ng-value="{{key}}"> {{ package }}
										</label>
										
									</div>
								</div>*/ ?>
								<?php /* </div>
								<div class="col-md-6 col-6  form-group has-feedback">
									<label set-required ><?= __("service_price") ?></label>
									<div class="div">
										<?= $this->Form->text("service_price", [
											"type" => "text",
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.service.service_price",
										]) ?>
										<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div> */ ?>

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
									<label set-required><?= __("service_contract_period") ?></label>
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

								<?php /* <div class="col-md-6 col-6  form-group has-feedback">
									<label set-required><?= __("service_price") ?></label>
									<div class="div">
										<?= $this->Form->text("service_price", [
											"type" => "text",
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.service.service_price",
										]) ?>
										<span class="fa fa-money form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div>

								<div class="col-md-6 col-6  form-group has-feedback">
									<label set-required><?= __("service_currency") ?></label>
									<div class="div">
										<?= $this->Form->text("service_currency", [
											"type" => "select",
											"options" => $this->Do->lcl($this->Do->get("currencies_icons")),
											"class" => "form-control has-feedback-left",
											"ng-model" => "rec.service.service_currency",
										]) ?>
										<span class="fa fa-plus form-control-feedback left" aria-hidden="true"></span>
									</div>
								</div> */ ?>


								<div class="row ">
									<div class="col-md-12 form-group has-feedback">
										<label set-required><?= __("service_price") ?></label>
										<div class="input-group">
											<?= $this->Form->text("service_currency", [
												"type" => "select",
												"options" =>
												["" => "Select"] +
													$this->Do->lcl($this->Do->get("currencies_icons")),
												"class" => "form-control col-3",
												"ng-model" => "rec.service.service_currency",
											]) ?>
											<?= $this->Form->text("service_price", [
												"type" => "text",
												"class" => "form-control col-9 has-feedback-left",
												"ng-model" => "rec.service.service_price",
												"only-numbers" => "",
											]) ?>
										</div>
									</div>
								</div>

								
					<div class="col-md-6 col-sm-6 form-group has-feedback">
						<label><?= __('property_id') ?></label>
						<div class="div">
							<tags-input ng-model="rec.sale.property" add-from-autocomplete-only="true" max-tags="1" placeholder="<?= __('property_id') ?>" display-property="text" key-property="value">
								<auto-complete source="loadTags($query, 'services')"></auto-complete>
							</tags-input>


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
							<button type="submit" class="btn btn-info" id="user_preloader"><span></span> <i class="fa fa-save"></i> <?= __(
																																		"save"
																																	) ?></button>
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
						<div class="row p-3">
							<div class="col-6 col-lg-6">
								<h4> </h4>
							</div>
							<div class="row ngif" ng-if="addDocument == 1">
								<div class="col-md-8 col-sm-8  form-group has-feedback">
									<label><?= __("doc_allowed_roles") ?></label>
									<div class="div">
										<?= $this->Form->control("doc_allowed_roles", [
											"class" => "form-control selectpicker",
											"type" => "select",
											"ng-model" => "rec.doc.doc_allowed_roles",
											// 'data-live-search' => false,
											"multiple" => true,
											// 'multi-select' => '1',
											"label" => false,
											"data-size" => 6,
											"data-done-button" => false,
											"options" => $this->Do->lcl(
												$this->Do->get("AdminRoles"),
												false,
												false
											),
										]) ?>
									</div>
								</div>

								<div class="row ngif" ng-if="addDocument == 1">
									<div class="col-md-8 col-sm-8 form-group has-feedback">
										<!-- <label><?= __("doc_allowed_roles") ?></label> -->
										<div class="div">
											<label ng-repeat="role in adminRoles">
												<input type="checkbox" ng-model="rec.doc.doc_allowed_roles[role.value]"> {{ role.label }}
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
							// show files list
							?>
							<div class="grid_row row" ng-repeat="doc in rec.<?= $ctrl ?>.docs">
								<div class="col-5 grid_header2">
									{{doc.doc_name}}
								</div>
								<div class="col-7 notwrapped text-right">
									<a class="small-btn" target="_blank" href="<?= $protocol .	":" . $path ?>/file/<?= $ctrls ?>_files/{{ doc.doc_name }}"><i class="fa fa-eye"></i></a>
									<a class="small-btn" href ng-click="rec.doc = doc; $parent.addDocument=1;"><i class="fa fa-edit"></i></a>
									<a class="small-btn" href ng-click="doDelete('/admin/docs/delete/'+doc.id, '#<?= $ctrl ?>_btn');"><i class="fa fa-trash"></i></a>
								</div>
							</div>
						<?php } else { ?>
							<div class="col-12 not_found_div"><i class="fa fa-info-circle"></i> <?= __("available_only_for_admins") ?></div>
						<?php } ?>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>