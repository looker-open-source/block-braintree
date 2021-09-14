view: subscription_status_history {
  sql_table_name: SUBSCRIPTION_STATUS_HISTORY
    ;;

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
    description: "The balance of the subscription."
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    description: "The price of the subscription."
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    description: "Where the subscription event was created."
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "The subscription status."
  }

  dimension: subscription_id {
    hidden: yes
    type: number
    sql: ${TABLE}.subscription_id ;;
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

  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
    description: "The Braintree Control Panel username of the person who performed an action that triggered the status change of the subscription."
  }

  measure: count {
    type: count
    drill_fields: [subscription.id]
  }

  measure: total_balance {
    type: sum
    sql: ${balance} ;;
    value_format_name: usd
  }
}
