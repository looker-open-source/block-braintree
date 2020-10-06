include: "//@{CORE_PROJECT}/views/masterpass_card_details.view.lkml"

view: +masterpass_card_details {
  sql_table_name: @{DATASET_NAME}.MASTERPASS_CARD_DETAILS ;;

  # Add customization here

}
