view: masterpass_card_details {
  sql_table_name: MASTERPASS_CARD_DETAILS ;;

  dimension: bin {
    type: number
    group_label: "Card Details"
    sql: ${TABLE}.bin ;;
    description: "The first 6 digits of the credit card, known as the bank identification number (BIN)."
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
    description: "The type of the credit card. "
  }

  dimension: cardholder_name {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.cardholder_name ;;
    description: "The cardholder name associated with the credit card."
  }

  dimension: commercial {
    type: yesno
    sql: ${TABLE}.commercial ;;
    description: "Whether the card type is a commercial card and is capable of processing Level 2 transactions. "
  }

  dimension: country_of_issuance {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.country_of_issuance ;;
    description: "The country that issued the credit card. Possible country values follow ISO 3166-1.The value Unknown will be returned if we cannot immediately determine the card's country of issuance from the bank identification number (BIN)."
  }

  dimension: debit {
    type: yesno
    sql: ${TABLE}.debit ;;
    description: "Whether the card is a debit card. "
  }

  dimension: durbin_regulated {
    type: yesno
    sql: ${TABLE}.durbin_regulated ;;
    description: "A value indicating whether the issuing bank's card range is regulated by the Durbin Amendment due to the bank's assets. "
  }

  dimension: expiration_month {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.expiration_month ;;
    description: "The expiration month of a credit card, formatted MM. May be used with expiration_year, and instead of expiration_date."
  }

  dimension: expiration_year {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.expiration_year ;;
    description: "The two or four digit year associated with a credit card, formatted YYYY or YY. May be used with expiration_month, and instead of expiration_date."
  }

  dimension: healthcare {
    type: yesno
    sql: ${TABLE}.healthcare ;;
    description: "Whether the card is a healthcare card. "
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
    description: "A URL that points to a payment method image resource (a PNG file) hosted by Braintree."
  }

  dimension: issuing_bank {
    type: string
    group_label: "Card Details"
    sql: ${TABLE}.issuing_bank ;;
    description: "The bank that issued the credit card."
  }

  dimension: last4 {
    type: number
    group_label: "Card Details"
    sql: ${TABLE}.last4 ;;
  }

  dimension: payroll {
    type: yesno
    sql: ${TABLE}.payroll ;;
    description: "Whether the card is a payroll card. "
  }

  dimension: prepaid {
    type: yesno
    sql: ${TABLE}.prepaid ;;
    description: "Whether the card is a prepaid card. "
  }

  dimension: product_id {
    type: number
    hidden: yes
    sql: ${TABLE}.product_id ;;
    description: "The code for the product type of the card (e.g. D (Visa Signature Preferred), G (Visa Business)). See Product ID codes below for possible values."
  }

  dimension: token {
    type: number
    group_label: "Card Details"
    sql: ${TABLE}.token ;;
    description: "An alphanumeric value that references a specific payment method stored in your Vault."
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
    label: "Number of Masterpass Card Transactions"
    value_format_name: decimal_0
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      cardholder_name,
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
