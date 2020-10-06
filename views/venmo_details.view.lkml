include: "//@{CORE_PROJECT}/views/venmo_details.view.lkml"

view: +venmo_details {
  sql_table_name: @{DATASET_NAME}.VENMO_DETAILS ;;
}
