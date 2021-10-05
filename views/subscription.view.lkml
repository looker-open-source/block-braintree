view: subscription {
  sql_table_name: SUBSCRIPTION ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    #type: number
    sql: ${TABLE}.id ;;
    description: "The string value representing a specific subscription in the Vault. Length and format of gateway-generated tokens and IDs may change at any time."
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
    description: "The amount of outstanding charges associated with a subscription."
  }

  dimension: billing_day_of_month {
    type: string
    sql: ${TABLE}.billing_day_of_month ;;
    description: "The value that specifies the day of the month that the gateway will charge the subscription on every billing cycle."
  }

  dimension_group: billing_period_end {
    type: time
    timeframes: [raw, date, month, year]
    sql: PARSE_TIMESTAMP("%F", ${TABLE}.billing_period_end_date) ;;
    description: "The end date for the current billing period, regardless of subscription status. Automatic retries on past due subscriptions do not change the start and end dates of the current billing period."
  }

  dimension_group: billing_period_start {
    type: time
    timeframes: [raw, date, month, year]
    sql: PARSE_TIMESTAMP("%F", ${TABLE}.billing_period_start_date) ;;
    description: "The start date for the current billing period, regardless of subscription status. Automatic retries on past due subscriptions do not change the start and end dates of the current billing period."
  }

  dimension_group: created {
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    type: time
    sql: ${TABLE}.created_at ;;
    description: "The date/time the object was created."
  }

  dimension: current_billing_cycle {
    group_label: "Billing Cycle"
    type: number
    sql: ${TABLE}.current_billing_cycle ;;
    description: "The subscription's current billing cycle. It is incremented each time the subscription passes the billing_period_end_date."
  }

  dimension: days_past_due {
    type: number
    sql: ${TABLE}.days_past_due ;;
    description: "The number of days that the subscription is past due. Read more about the past due status in the Recurring Billing guide."
  }

  dimension: failure_count {
    hidden: yes
    type: number
    sql: ${TABLE}.failure_count ;;
    description: "The number of consecutive failed attempts by our recurring billing engine to charge a subscription. This count includes the transaction attempt that caused the subscription's status to become past due, starting at 0 and increasing for each failed attempt. If the subscription is active and no charge attempts failed, the count is 0."
  }

  dimension_group: first_billing {
    type: time
    timeframes: [raw, date, month, year]
    sql: PARSE_TIMESTAMP("%F", ${TABLE}.first_billing_date) ;;
    description: "The day the subscription starts billing."
  }

  dimension: has_trial_period {
    group_label: "Trial"
    type: yesno
    sql: ${TABLE}.has_trial_period ;;
  }

  dimension: merchant_account_id {
    type: number
    sql: ${TABLE}.merchant_account_id ;;
    description: "The merchant account ID used for the subscription. Currency is also determined by merchant account ID."
  }

  dimension: never_expires {
    type: yesno
    sql: ${TABLE}.never_expires ;;
  }

  dimension_group: next_billing {
    type: time
    timeframes: [
      raw,
      date,
      month,
      year
    ]
    sql: PARSE_TIMESTAMP("%F",${TABLE}.next_billing_date);;
    description: "The date that the gateway will try to bill the subscription again. The gateway adjusts this date each time it tries to charge the subscription. If the subscription is past due and you have set your processing options to automatically retry failed transactions, the gateway will continue to adjust this date, advancing it based on the settings that you configured in advanced settings."
  }

  dimension: next_billing_period_amount {
    group_label: "Billing"
    type: number
    sql: ${TABLE}.next_billing_period_amount ;;
    description: "The total subscription amount for the next billing period. This amount includes add-ons and discounts but does not include the current balance."
  }

  dimension: number_of_billing_cycles {
    group_label: "Billing Cycle"
    type: number
    sql: ${TABLE}.number_of_billing_cycles ;;
    description: "The number of billing cycles of the subscription."
  }

  dimension_group: paid_through {
    type: time
    timeframes: [
      raw,
      date,
      month,
      year
    ]
    sql: PARSE_TIMESTAMP("%F", ${TABLE}.paid_through_date) ;;
    description: "The date through which the subscription has been paid. It is the billing_period_end_date at the time of the last successful transaction. If the subscription is pending (has a future start date), this field is nil."
  }

  dimension: payment_method_token {
    type: number
    sql: ${TABLE}.payment_method_token ;;
    description: "An alphanumeric value that references a specific payment method stored in your Vault."
  }

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
    description: "The plan identifier."
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    description: "The base price specified for a subscription, formatted like '10' or '10.00'."
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "Status of subscription."
  }

  dimension: trial_duration {
    group_label: "Trial"
    label: "Duration"
    type: number
    sql: ${TABLE}.trial_duration ;;
  }

  dimension: trial_duration_unit {
    group_label: "Trial"
    label: "Duration Unit"
    type: string
    sql: ${TABLE}.trial_duration_unit ;;
    description: "The trial unit specified in a plan. Specify day or month. Specifying a trial duration unit via the API will override the subscription's plan details."
  }

  dimension_group: updated {
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
    type: time
    sql: ${TABLE}.updated_at ;;
    description: "The date/time the object was last updated. If a subscription has been canceled, this value will represent the date/time of cancellation."
  }

  measure: count {
    type: count
    label: "Number of Subscriptions"
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: total_balance {
    type: sum
    sql: ${balance} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      merchant_account.id,
      subscription_discount.count,
      subscription_status_history.count,
      subscription_add_on.count,
      transaction.count,
      total_balance
    ]
  }
}
