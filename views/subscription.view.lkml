include: "//@{CORE_PROJECT}/views/subscription.view.lkml"

view: +subscription {
  sql_table_name: @{DATASET_NAME}.SUBSCRIPTION ;;
}
