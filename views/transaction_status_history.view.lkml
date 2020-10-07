include: "//@{CORE_PROJECT}/views/transaction_status_history.view.lkml"

view: +transaction_status_history {
  sql_table_name: @{DATASET_NAME}.TRANSACTION_STATUS_HISTORY
    ;;
}
