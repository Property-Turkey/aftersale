<div class="modal fade" id="viewExpense_mdl" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="listing-modal-1 modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">
                    <?= __("view_expense") ?>
                </h4>
            </div>

            <div class="modal-body row">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#tab1" role="tab">Expenses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#tab2" ng-click="addDocument = 1">Document</a>
                    </li>
                </ul>
                <div class="tab-content col-12">
                    <div class=" tab-pane active" id="tab1">

                        <div class="grid">
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __("owner_id") ?></div>
                                <div class="col-md-9 notwrapped">{{rec.expense.owner.user_fullname }}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __("expense_type") ?></div>
                                <div class="col-md-9 notwrapped" ng-bind-html="DtSetter( 'expense_type', rec.expense.expense_type )"></div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __("expense_amount") ?></div>
                                <div class="col-md-9 notwrapped">{{DtSetter('currencies_icons', rec.expense.expense_currency)}}{{ rec.expense.expense_amount}} </div>
                            </div>
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __("expense_description") ?></div>
                                <div class="col-md-9 notwrapped">{{rec.expense.expense_description}}</div>
                            </div>
                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __("category_id") ?></div>
                                <div class="col-md-9 notwrapped">{{rec.expense.category.category_name}}</div>
                            </div>

                            <div class="grid_row row">
                                <div class="col-md-3 grid_header2"><?= __("stat_created") ?></div>
                                <div class="col-md-9 notwrapped">{{rec.expense.stat_created}}</div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab2">
                        <div class="grid">
                            <div class="container">                                             
                                    <div class="grid">
                                <div class="col-md-3 grid_header2"><?= __('document') ?></div>
                                <div class="col-md-9 notwrapped">{{rec.expense.docs}}</div>
                            </div>                                                                                                  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>  
 </div>