include: "//@{CORE_PROJECT}/views/transaction_discount.view.lkml"

view: +transaction_discount {
  sql_table_name: @{DATASET_NAME}.TRANSACTION_DISCOUNT
    ;;
}
