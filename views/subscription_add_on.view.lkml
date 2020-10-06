include: "//@{CORE_PROJECT}/views/subscription_add_on.view.lkml"

view: +subscription_add_on {
  sql_table_name: @{DATASET_NAME}.SUBSCRIPTION_ADD_ON
    ;;
}
