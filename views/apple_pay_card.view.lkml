view: apple_pay_card{
  sql_table_name: APPLE_PAY_CARD ;;

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
    description: "The type of the credit card. "
  }

  dimension: expiration_month {
    type: string
    sql: ${TABLE}.expiration_month ;;
    description: "The expiration month of the card, formatted MM."
  }

  dimension: expiration_year {
    type: string
    sql: ${TABLE}.expiration_year ;;
    description: "The 4-digit year associated with the card, formatted YYYY."
  }

  dimension: last4 {
    type: number
    sql: ${TABLE}.last4 ;;
    description: "The last 4 digits of the device-specific account number (DPAN)."
  }

  dimension: payment_instrument_name {
    type: string
    sql: ${TABLE}.payment_instrument_name ;;
    description: "A description of the payment method intended for display to the user, typically card type and last 4 digits of the physical card number stored by Wallet (formerly Passbook). We receive this description alongside the DPAN when processing an Apple Pay transaction."
  }

  dimension: source_description {
    type: string
    sql: ${TABLE}.source_description ;;
    description: "Indicates what type of payment method was tokenized by the network. Also includes an identifier for the account (e.g. last 4 digits if the payment method was a credit card)."
  }

  dimension: token {
    type: number
    sql: ${TABLE}.token ;;
    description: "An alphanumeric value that references a specific payment method stored in your Vault."
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    label: "Number of Apple Pay Transactions"
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      payment_instrument_name,
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
