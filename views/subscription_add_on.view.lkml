view: subscription_add_on {
  sql_table_name: SUBSCRIPTION_ADD_ON
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
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
    description: "The value that defines whether the modification being applied to a plan or subscription is an add-on or a discount. "
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
    hidden: yes
    type: number
    sql: ${TABLE}.plan_id ;;
    description: "The plan identifier."
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
    description: "The number of times this particular add-on is applied to the subscription."
  }

  dimension: subscription_id {
    hidden: yes
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  measure: count {
    label:"Add-On count"
    type: count
    drill_fields: [id, name, subscription.id]
  }
}
