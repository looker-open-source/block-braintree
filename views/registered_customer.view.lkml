include: "//@{CORE_PROJECT}/views/registered_customer.view.lkml"
view: +registered_customer {
  sql_table_name: @{DATASET_NAME}.REGISTERED_CUSTOMER;;
}
