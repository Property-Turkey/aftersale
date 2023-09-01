<?php
$parent_id = isset($this->request->getParam('pass')[0]) ? $this->request->getParam('pass')[0] : 0;
?>

<div class="modal fade" id="addEditService_mdl" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<h4 ng-if="!rec.service.id"><?= __('add') ?></h4>
					<h4 ng-if="rec.service.id"><?= __('edit') ?></h4>
				</h4>
			</div>
			<div class="modal-body">
				<div class="x_content">

					<button ng-click="
							doGet('/admin/services/index?list=1', 'list', 'services');
							newEntity('service');
						" id="service_btn" class="hideIt"></button>

					<form class="form-label-left input_mask " id="service_form" enctype="multipart/form-data" novalidate="novalidate" ng-submit="doSave (rec.service, 'service', 'services', '#service_btn'); ">

						<div class="col-md-12 col-sm-12  form-group has-feedback" ng-if="rec.service.parent_name">
							<h2><?= __('user_id') ?> : {{rec.service.user_id}}</h2>
						</div>
						<div class=" col-6 col-sm-6 col-md-6 ">
							<span class="icn">
								<a href data-toggle="modal" data-target="#docs_mdl" data-dismiss="modal" class="btn btn-info">
									<span class="fa fa-search"></span> <span class="hideMob"><?= __('document') ?></span>
								</a>
							</span>
						</div>
						<div class="col-md-6 col-sm-6 form-group has-feedback">
							<label set-required><?= __('owner_id') ?></label>
							<div class="div">
								<!-- Client select input -->
								<select class="form-control has-feedback-left" ng-model="rec.service.owner_id" ng-change="onClientSelectionChange()">
									<option value="">Select Owner</option>
									<option value="add_client">Add Owner</option>
									<option ng-repeat="(ownerId, ownerName) in DtSetter('ownerList', 'list')" value="{{ownerId}}">{{ownerName}}</option>
								</select>
								<span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('tenant_id') ?></label>
							<div class="div">
								<?= $this->Form->control('tenant_id', [
									'type' => 'select',
									'options' => $tenants,
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.tenant_id'
								]) ?>
								<span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<!-- <div class="col-md-6 col-6  form-group has-feedback">
							<label set-required ><?= __('property_id') ?></label>
							<div class="div">
							<?= $this->element('colActions', ['url' => 'services/index/', 'col' => 'property_id', 'search' => 'property_id']) ?> 									
							</div>
						</div> -->

						<div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('service_desc') ?></label>
							<div class="div">
								<?= $this->Form->text('service_desc', [
									'type' => 'textarea',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.service_desc'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<!-- <div class="col-md-6 col-6  form-group has-feedback">
							<label><?= __('package_name') ?></label>
							<div class="div">
								<?= $this->Form->text('package_name', [
									'type' => 'select',
									'options' => $packages,
									'label' => false,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.package_name'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div> -->

						<!-- </div>
                                <div class="col-md-6 col-6 form-group has-feedback">
                        <label><?= __('package_id') ?></label>
                        <div class="div">
                            <label class="radio-inline" ng-repeat="(key, package) in DtSetter('packages', 'list') track by $index">
                                <input type="checkbox" ng-model="rec.service.servicePackageObj[$index].package_id" ng-value="{{key}}"> {{ package }}
                            </label>
                            
                        </div>
                    </div>                    -->
						<!-- </div>
						
						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required ><?= __('service_price') ?></label>
							<div class="div">
								<?= $this->Form->text('service_price', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.service_price',

								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div> -->

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('service_vat') ?></label>
							<div class="div">
								<?= $this->Form->text('service_vat', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.service_vat',

								]) ?>
								<span class="fa fa-dollar-sign form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('service_tax') ?></label>
							<div class="div">
								<?= $this->Form->text('service_tax', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.service_tax',

								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>


						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('service_contract_period') ?></label>
							<div class="div">
								<?= $this->Form->text('service_contract_period', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.service_contract_period'
								]) ?>
								<span class="fa fa-vcard form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('service_price') ?></label>
							<div class="div">
								<?= $this->Form->text('service_price', [
									'type' => 'text',
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.service_price'
								]) ?>
								<span class="fa fa-header form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('service_currency') ?></label>
							<div class="div">
								<?= $this->Form->text('service_currency', [
									'type' => 'select',
									'options' => $this->Do->lcl($this->Do->get('currencies_icons')),
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.service_currency'
								]) ?>
								<span class="fa fa-plus form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('property_id ') ?></label>
							<div class="div">
								<?= $this->Form->text('property_id ', [
									'type' => 'select',
									'options' =>$Properties,
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.property_id '
								]) ?>
								<span class="fa fa--plus-square-o form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-6  form-group has-feedback">
							<label set-required><?= __('package_id') ?></label>
							<div class="div">
								<?= $this->Form->text('package_id', [
									'type' => 'select',
									'options' => $packages,
									//'options' => $this->Do->lcl($this->Do->get('package_currency')),
									'class' => 'form-control has-feedback-left',
									'ng-model' => 'rec.service.package_id'
								]) ?>
								<span class="fa fa-info form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="clearfix"></div>
						<div class="form-group ">
							<div class="col-md-12 col-sm-6  form-group has-feedback ">
								<button type="submit" class="btn btn-info"><span><i class="fa fa-save"></i></span> <?= __('save') ?></button>
							</div>
						</div>

					</form>

					<button type="button" id="user_btn" class="hideIt" ng-click="
            doGet('/admin/users/index?list=1', 'list', 'users');
            rec.user.id>0 ? '' : rec.user = {};
            doClick('.close');
          "></button>

					<form class="row" id="user_form" ng-show="showAddClientForm" ng-submit="
            rec.user.img = filesInfo.user_photos;
            doSave(rec.user, 'user', 'users', '#user_btn', '#user_preloader');">


						<div class="col-md-6 col-sm-6  form-group has-feedback">
							<label set-required><?= __('user_fullname') ?></label>
							<div class="div">
								<?= $this->Form->control('user_fullname', [
									'class' => 'form-control has-feedback-left',
									'label' => false,
									'type' => 'text',
									'ng-model' => 'rec.user.user_fullname',
									'placeholder' => __('user_fullname'),
								]) ?>
								<span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-sm-6  form-group has-feedback">
							<label set-required><?= __('email') ?></label>
							<div class="div">
								<?= $this->Form->control('email', [
									'class' => 'form-control has-feedback-left',
									'label' => false,
									'type' => 'email',
									'ng-model' => 'rec.user.email',
									'placeholder' => __('email'),
								]) ?>
								<span class="fa fa-at form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-6 col-sm-6  form-group has-feedback">
							<label set-required><?= __('password') ?></label>
							<div class="div">
								<?= $this->Form->control('password', [
									'class' => 'form-control has-feedback-left',
									'label' => false,
									'type' => 'password',
									'ng-model' => 'rec.user.password',
									//'ng-readonly'=>true,
									'value' => 'Property123',
									'placeholder' => __('Property123'),
								]) ?>
								<span class="fa fa-lock form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-12 col-sm-12 mb-2 mt-2"> </div>

						<div class="col-md-6 col-sm-6  form-group has-feedback">
							<label><?= __('mobile') ?></label>
							<div class="div">
								<?= $this->Form->control('user_configs[mobile]', [
									'class' => 'form-control has-feedback-left',
									'label' => false,
									'type' => 'tel',
									'only-numbers' => '',
									'ng-model' => 'rec.user.user_configs.mobile',
									'placeholder' => __('mobile'),
								]) ?>
								<span class="fa fa-mobile form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<div class="col-md-12 col-sm-12  form-group has-feedback">
							<label><?= __('address') ?></label>
							<div class="div">
								<?= $this->Form->control('user_configs[address]', [
									'class' => 'form-control has-feedback-left',
									'label' => false,
									'type' => 'textarea',
									'ng-model' => 'rec.user.user_configs.address',
									'placeholder' => __('address'),
								]) ?>
								<span class="fa fa-map-marker form-control-feedback left" aria-hidden="true"></span>
							</div>
						</div>

						<?php if (in_array($authUser['user_role'], ['admin.root', 'user.tenant', 'user.landlord'])) { ?>
							<div class="col-md-6 col-sm-6  form-group has-feedback">
								<label set-required><?= __('user_role') ?></label>
								<div class="div">
									<?= $this->Form->control('user_role', [
										'class' => 'form-control has-feedback-left',
										'label' => false,
										'type' => 'select',
										'ng-model' => 'rec.user.user_role',
										'options' => $this->Do->lcl($this->Do->get('AdminRoles')),
										'empty' => __('select_role'),
									]) ?>
									<span class="fa fa-flash form-control-feedback left" aria-hidden="true"></span>
								</div>
							</div>
						<?php } ?>

						<div class="clearfix"></div>
						<div class="col-md-12 col-sm-12  form-group has-feedback ">
							<button type="submit" class="btn btn-info" id="user_preloader"><span></span> <i class="fa fa-save"></i> <?= __('save') ?></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>