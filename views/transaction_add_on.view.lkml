include: "//@{CORE_PROJECT}/views/transaction_add_on.view.lkml"

view: +transaction_add_on {
  sql_table_name: @{DATASET_NAME}.TRANSACTION_ADD_ON;;
}
