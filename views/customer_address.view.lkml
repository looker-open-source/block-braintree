include: "//@{CORE_PROJECT}/views/customer_address.view.lkml"

view: +customer_address {
  sql_table_name: @{DATASET_NAME}.CUSTOMER_ADDRESS;;

  # Add customization here

}
