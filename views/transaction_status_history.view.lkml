view: transaction_status_history{
  sql_table_name: TRANSACTION_STATUS_HISTORY
    ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    description: "How a transaction was created"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "A record of the statuses that a transaction has progressed through."
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: transaction_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
    description: "The Braintree Control Panel username of the person who performed an action that triggered the status change of the transaction."
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      transaction.shipping_address_country_name,
      transaction.billing_address_country_name,
      transaction.shipping_address_first_name,
      transaction.refunded_transaction_id,
      transaction.shipping_address_last_name,
      transaction.billing_address_first_name,
      transaction.billing_address_last_name
    ]
  }
}
