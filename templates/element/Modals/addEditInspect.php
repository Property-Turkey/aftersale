<?php
$parent_id = isset($this->request->getParam('pass')[0]) ? $this->request->getParam('pass')[0] : 0;
?>

<div class="modal fade" id="addEditInspect_mdl" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title">
					<h4 ng-if="!rec.inspect.id"><?= __('add') ?></h4>
					<h4 ng-if="rec.inspect.id"><?= __('edit') ?></h4>
				</h4>
			</div>
			<div class="modal-body">
				<div class="x_content">
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="x_content">
								<button ng-click="
							doGet('/admin/inspects/index?list=1', 'list', 'inspects');
							newEntity('inspect');
						" id="inspect_btn" class="hideIt"></button>

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
										<!-- <label><?= __('inspect_rate') ?></label> -->
										<div class="div">
											<?php
											//$inspectRates = $this->Do->cat(21);
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
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>