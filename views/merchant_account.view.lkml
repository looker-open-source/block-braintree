include: "//@{CORE_PROJECT}/views/merchant_account.view.lkml"

view: +merchant_account {
  sql_table_name: @{DATASET_NAME}.MERCHANT_ACCOUNT ;;

}
