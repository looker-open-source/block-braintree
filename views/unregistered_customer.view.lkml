include: "//@{CORE_PROJECT}/views/unregistered_customer.view.lkml"

view: +unregistered_customer {
  sql_table_name: @{DATASET_NAME}.UNREGISTERED_CUSTOMER
    ;;
}
