include: "//@{CORE_PROJECT}/views/dispute.view.lkml"

view: +dispute {
  sql_table_name: @{DATASET_NAME}.DISPUTE ;;

  # Add customization here

}
