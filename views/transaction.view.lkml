include: "//@{CORE_PROJECT}/views/transaction.view.lkml"

view: +transaction {
  sql_table_name: @{DATASET_NAME}.TRANSACTION ;;
}
