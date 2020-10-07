include: "//@{CORE_PROJECT}/views/paypal_details.view.lkml"

view: +paypal_details {
  sql_table_name: @{DATASET_NAME}.PAYPAL_DETAILS ;;

}
