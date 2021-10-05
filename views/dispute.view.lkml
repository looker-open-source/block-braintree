view: dispute {
  sql_table_name: DISPUTE ;;

  dimension: amount {
    type: number
    hidden: yes
    sql: ${TABLE}.amount ;;
    description: "The billing amount of the request."
  }

  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
    description: "The kind of dispute. "
  }

  dimension_group: opened {
    type: time
    sql: PARSE_TIMESTAMP("%F", ${TABLE}.opened_date) ;;
    timeframes: [
      raw,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
    description: "The reason the dispute was created. "
  }

  dimension: reason_display {
    type: string
    sql:
    CASE WHEN ${reason} = "cancelled_recurring_transaction" THEN "Canceled Recurring Transaction"
         WHEN ${reason} = "credit_not_processed" THEN "Credit Not Processed"
         WHEN ${reason} = "duplicate" THEN "Duplicate"
         WHEN ${reason} = "fraud" THEN "Fraud"
         WHEN ${reason} = "general" THEN "General"
         WHEN ${reason} = "invalid_account" THEN "Invalid Account"
         WHEN ${reason} = "not_recognized" THEN "Not Recognized"
         WHEN ${reason} = "product_not_received" THEN "Product Not Received"
         WHEN ${reason} = "product_unsatisfactory" THEN "Product Unsatisfactory"
         WHEN ${reason} = "transaction_amount_differs" THEN "Transaction Amount Differs"
         ELSE NULL END
        ;;
  }

  dimension_group: received {
    type: time
    sql: ${TABLE}.received_date ;;
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
    description: "The date the dispute was received by the merchant."
  }

  dimension_group: reply_by {
    type: time
    timeframes: [raw, date, month, year]
    sql: PARSE_TIMESTAMP("%F", ${TABLE}.reply_by_date) ;;
    description: "The merchant Reply By date that is referenced in the gateway."
  }

  dimension_group: to_reply {
    type: duration
    intervals: [day, month]
    sql_start: ${transaction.today_raw} ;;
    sql_end: ${reply_by_raw} ;;
    description: "Time between a dispute's open date and reply by date"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "The status of the dispute. "
  }

  dimension: transaction_id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  dimension_group: won {
    type: time
    timeframes: [raw, date, month, year]
    sql: PARSE_TIMESTAMP("%F", ${TABLE}.won_date) ;;
  }

  measure: count {
    type: count
    label: "Number of Disputes"
    drill_fields: [detail*]
  }

  measure: total_dispute_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      transaction.id,
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


view: dispute_ndt {
  derived_table: {
    explore_source: transaction {
      column: count { field: dispute.count }
      column: reason_display { field: dispute.reason_display }
      filters: {
        field: dispute.reason_display
        value: "-NULL"
      }
    }
  }
  dimension: count {
    hidden: yes
    label: "Dispute Number of Disputes"
    type: number
  }
  dimension: reason_display { hidden:yes }
}
