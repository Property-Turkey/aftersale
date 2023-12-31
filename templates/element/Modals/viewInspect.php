<div class="modal fade" id="viewInspect_mdl" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">
                    <?= __('view_inspect') ?>
                </h4>
            </div>

            <div class="modal-body row">
                <div class="col-md-12 col-sm-12">
                    <div class="view_page">
                        <div class="grid">
                    
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('user_id')?></div>
                                <div class="col-md-9 notwrapped">{{rec.inspect.user.user_fullname}}</div>
                            </div>
                            
                            <!-- <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('owner_id')?></div>
                                <div class="col-md-9 notwrapped">{{rec.inspect.service.owner_id}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('property_ref')?></div>
                                <div class="col-md-9 notwrapped">{{rec.inspect.service.property_id}}</div>
                            </div> -->

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('inspect_desc')?></div>
                                <div class="col-md-9 notwrapped">{{rec.inspect.inspect_desc}}</div>
                            </div>

                            <div class="grid_row row">
                            <div class="col-md-3 grid_header2"><?=__('inspect_rate')?></div>
                            <!-- <div class="col-md-6 col-6 form-group has-feedback"> -->
							<div class="div">
								<?php					
								foreach ($this->Do->cat(21) as $key => $rate) : ?>
									<div class="col-md-2 col-2 form-group has-feedback">
										<label><?= $rate ?>
											<div class="div">
												<?php
												$isChecked = false;
												if (isset($jsonData[$rate]) && $jsonData[$rate] == '1') {
													$isChecked = true;}?>
								<input type="checkbox" id="<?= $key ?>" ng-model="rec.inspect.inspect_rate['<?= $rate ?>']" value="1" <?php if ($isChecked) echo "checked"; ?>>
										</label>
									</div>
							</div>
						<?php endforeach; ?>
						</div>
                        </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?=__('stat_created')?></div>
                                <div class="col-md-9 notwrapped">{{rec.inspect.stat_created}}</div>
                            </div>
                           
                            <div class="grid_row row">
                              <div class="col-md-3 grid_header2"><?=__('rec_state')?></div>
                                <div class="col-md-9 notwrapped" ng-bind-html="DtSetter( 'bool2', rec.inspect.rec_state )"></div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>