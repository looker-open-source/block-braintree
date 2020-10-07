include: "//@{CORE_PROJECT}/views/subscription_status_history.view.lkml"

view: +subscription_status_history {
  sql_table_name: @{DATASET_NAME}.SUBSCRIPTION_STATUS_HISTORY
    ;;
}
