include: "//@{CORE_PROJECT}/views/visa_checkout_details.view.lkml"

view: +visa_checkout_details {
  sql_table_name: @{DATASET_NAME}.VISA_CHECKOUT_DETAILS ;;
}
