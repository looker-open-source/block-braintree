view: transaction_discount {
  sql_table_name: TRANSACTION_DISCOUNT
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    hidden: yes
    sql: ${TABLE}.amount ;;
    description: "The discount amount."
  }

  dimension: current_billing_cycle {
    type: number
    sql: ${TABLE}.current_billing_cycle ;;
    description: "The discount's current billing cycle. It is incremented each time the discount is successfully applied."
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    description: "A description of the discount."
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
    description: "The name of the discount."
  }

  dimension: never_expires {
    type: yesno
    sql: ${TABLE}.never_expires ;;
    description: "A value indicating whether a discount's billing cycle is set to never expire instead of running for a specific number of billing cycles."
  }

  dimension: number_of_billing_cycles {
    type: number
    sql: ${TABLE}.number_of_billing_cycles ;;
    description: "Specifies the number of billing cycles of the discount."
  }

  dimension: plan_id {
    hidden: yes
    type: number
    sql: ${TABLE}.plan_id ;;
  }

  dimension: quantity {
    type: number
    hidden: yes
    sql: ${TABLE}.quantity ;;
    description: "The number of times this particular discount is applied to the subscription."
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  measure: total_discount_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: average_discount_amount {
    type: average
    sql: ${amount} ;;
    value_format_name: usd
  }

  measure: total_quantity {
    type: sum
    sql: ${quantity} ;;
    value_format_name: decimal_0
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
