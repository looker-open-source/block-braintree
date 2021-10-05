view: venmo_details {
  sql_table_name: VENMO_DETAILS ;;

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
    description: "A URL that points to a payment method image resource (a PNG file) hosted by Braintree."
  }

  dimension: source_description {
    type: string
    sql: ${TABLE}.source_description ;;
    description: "A short description of the payment method, including the Venmo username."
  }

  dimension: token {
    type: number
    sql: ${TABLE}.token ;;
    description: "An alphanumeric value that references a specific payment method stored in your Vault."
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
    description: "The Venmo username of the Venmo account."
  }

  dimension: venmo_user_id {
    type: number
    sql: ${TABLE}.venmo_user_id ;;
    description: "The Venmo user ID of the Venmo account."
  }

  measure: count {
    type: count
    label: "Number of Venmo Transactions"
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      username,
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
