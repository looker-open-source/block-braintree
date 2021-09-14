view: transaction_add_on {
  sql_table_name: TRANSACTION_ADD_ON;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: amount {
    type: number
    hidden: yes
    sql: ${TABLE}.amount ;;
    description: "The add on amount"
  }

  dimension: current_billing_cycle {
    type: number
    sql: ${TABLE}.current_billing_cycle ;;
    description: "The add-on's current billing cycle. It is incremented each time the add-on is successfully applied."
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    description: "A description of the add-on."
  }

  dimension: kind {
    hidden: yes
    type: string
    sql: ${TABLE}.kind ;;
    description: "The value that defines whether the modification being applied to a plan or subscription is an add-on or a discount."
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the add-on."
  }

  dimension: never_expires {
    type: yesno
    sql: ${TABLE}.never_expires ;;
  }

  dimension: number_of_billing_cycles {
    hidden: yes
    type: number
    sql: ${TABLE}.number_of_billing_cycles ;;
    description: "The number of billing cycles of the subscription."
  }

  dimension: plan_id {
    type: number
    hidden: yes
    sql: ${TABLE}.plan_id ;;
    description: "The plan identifier."
  }

  dimension: quantity {
    type: number
    hidden: yes
    sql: ${TABLE}.quantity ;;
    description: "The number of times this particular add-on is applied to the subscription. "
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    label: "Number of Add-Ons"
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  measure: total_add_on_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: total_add_on_quantity {
    type: sum
    sql: ${quantity} ;;
    value_format_name: decimal_0
  }

  measure: average_add_on_quantity {
    type: average
    sql: ${quantity} ;;
    value_format_name: decimal_1
  }

  measure: average_add_on_amount {
    type: average
    sql: ${amount} ;;
    value_format_name: decimal_1
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
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
