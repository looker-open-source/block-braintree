include: "//@{CORE_PROJECT}/views/subscription_discount.view.lkml"

view: +subscription_discount {
  sql_table_name: @{DATASET_NAME}.SUBSCRIPTION_DISCOUNT
    ;;
}
