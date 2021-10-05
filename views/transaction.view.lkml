view: transaction {
  sql_table_name: TRANSACTION ;;

  dimension: refunded_transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.refunded_transaction_id ;;
    description: "The sale transaction ID associated with a refund transaction. See the transaction API requests section for details."
  }

  dimension: amount {
    type: number
    hidden: yes
    sql: ${TABLE}.amount ;;
    description: "The billing amount of the request."
  }

  dimension: authorized_transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.authorized_transaction_id ;;
  }

  dimension: billing_address_company {
    group_label: "Billing"
    type: string
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: billing_address_country_name {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_country_name ;;
  }

  dimension: billing_address_first_name {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_first_name ;;
  }

  dimension: billing_address_last_name {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_last_name ;;
  }

  dimension: billing_address_locality {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_locality ;;
  }

  dimension: billing_address_postal_code {
    type: zipcode
    group_label: "Billing"
    sql: ${TABLE}.billing_address_postal_code ;;
  }

  dimension: billing_address_region {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_region ;;
  }

  dimension: billing_address_street_address {
    type: string
    group_label: "Billing"
    sql: ${TABLE}.billing_address_street_address ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
    description: "If the transaction request was performed through a shopping cart provider or Braintree partner, this field will have a string identifier for that shopping cart provider or partner. For PayPal transactions, this maps to the PayPal account's bn_code."
  }

  dimension: currency_iso_code {
    type: string
    sql: ${TABLE}.currency_iso_code ;;
    description: "The currency for the transaction (e.g. 'USD' for US dollars). See the ISO 4217 codes."
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: registered_customer {
    type: yesno
    sql: CASE WHEN ${registered_customer.id} IS NULL THEN FALSE ELSE TRUE END;;
  }

  dimension_group: disbursement_date {
    group_label: "Disbursement"
    type: time
    timeframes: [
      raw,
      date,
      month
    ]
    sql: PARSE_TIMESTAMP("%F", ${TABLE}.disbursement_date) ;;
    description: "The date that the funds associated with this transaction were disbursed. This attribute is only available if you have an eligible merchant account."
  }

  dimension: disbursement_funds_held {
    type: yesno
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_funds_held ;;
  }

  dimension: disbursement_settlement_amount {
    type: number
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_settlementAmount ;;
  }

  dimension: disbursement_settlement_currency_exchange_rate {
    type: number
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_settlementCurrencyExchangeRate ;;
  }

  dimension: disbursement_settlement_currency_iso_code {
    type: string
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_settlement_currency_iso_code ;;
  }

  dimension: disbursement_success {
    type: yesno
    group_label: "Disbursement"
    sql: ${TABLE}.disbursement_success ;;
  }

  dimension: id {
    type: string
    label: "Transaction ID"
    sql: ${TABLE}.id ;;
    primary_key: yes
    description: "The shipping details ID. A customer Vault record can contain up to 50 shipping and billing addresses, each with a unique ID."
  }

  dimension: merchant_account_id {
    type: number
    hidden: yes
    sql: ${TABLE}.merchant_account_id ;;
    description: "The merchant account ID used to create a transaction. Currency is also determined by merchant account ID."
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    description: "The order ID of the transaction. On PayPal transactions, this field maps to the PayPal invoice number. PayPal invoice numbers are unique in your PayPal business account."
  }

  dimension: payment_instrument_type {
    type: string
    sql: ${TABLE}.payment_instrument_type ;;
    description: "The method of payment used to process the transaction. "
  }

  dimension: plan_id {
    type: number
    hidden: yes
    sql: ${TABLE}.plan_id ;;
    description: "The plan identifier."
  }

  dimension: processor_authorization_code {
    group_label: "Processor Authorization"
    type: number
    sql: ${TABLE}.processor_authorization_code ;;
    description: "The authorization code returned by the processor."
  }

#https://developers.braintreepayments.com/reference/general/processor-responses/authorization-responses
  dimension: processor_authorization_type  {
    group_label: "Processor Authorization"
    case: {
      when: {
        sql: ${processor_authorization_code} < 2000 ;;
        label: "Approved"
      }
      when: {
        sql: ${processor_authorization_code} IN (
                2000,2001,2002,2003,
                2016,2025,2026,2034,
                2035,2038,2040,2042,
                2046,2048,2057,2062,
                2092,2099
              )
              OR ${processor_authorization_code} >= 2101 AND ${processor_authorization_code} <= 3000
        ;;
        label: "Soft Decline"
      }
      else: "Hard Decline"
    }
  }

  dimension: purchase_order_number {
    type: number
    sql: ${TABLE}.purchase_order_number ;;
    description: "A Level 2 data field that can be used to store a purchase order identification value."
  }

  dimension: recurring {
    type: yesno
    sql: ${TABLE}.recurring ;;
    description: "A value indicating whether the transaction was passed with a recurring ecommerce indicator (ECI) flag."
  }

  dimension: risk_data_decision {
    type: string
    sql: ${TABLE}.risk_data_decision ;;
    description: "The risk decision."
  }

  dimension: risk_data_id {
    type: number
    hidden: yes
    sql: ${TABLE}.risk_data_id ;;
    description: "The risk data identifier."
  }

  dimension: service_fee_amount {
    type: number
    hidden: yes
    sql: ${TABLE}.service_fee_amount ;;
    description: "The portion of a sub-merchant's transaction revenue that was routed to the master merchant account.Available to Braintree Marketplace merchants. See Creating Transactions with Service Fees for more details."
  }

  dimension: settlement_batch_id {
    type: number
    hidden: yes
    sql: ${TABLE}.settlement_batch_id ;;
    description: "The identification value of the settlement batch in which the transaction was processed. The format may change at any time but is currently YYYY-MM-DD_m_d where m is the merchant account token without special characters and d is an alphanumeric string to guarantee uniqueness."
  }

  dimension: shipping_address_company {
    type: string
    group_label: "Shipping Address"
    label: "Company"
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: shipping_address_country_name {
    type: string
    map_layer_name: countries
    group_label: "Shipping Address"
    label: "Country Name"
    sql: ${TABLE}.shipping_address_country_name ;;
  }

  dimension: shipping_address_first_name {
    type: string
    group_label: "Shipping Address"
    label: "First Name"
    sql: ${TABLE}.shipping_address_first_name ;;
  }

  dimension: shipping_address_last_name {
    type: string
    group_label: "Shipping Address"
    label: "Last Name"
    sql: ${TABLE}.shipping_address_last_name ;;
  }

  dimension: shipping_address_locality {
    type: string
    group_label: "Shipping Address"
    label: "Locality"
    sql: ${TABLE}.shipping_address_locality ;;
  }

  dimension: shipping_address_postal_code {
    type: zipcode
    group_label: "Shipping Address"
    label: "Postal Code"
    sql: ${TABLE}.shipping_address_postal_code ;;
  }

  dimension: shipping_address_region {
    type: string
    group_label: "Shipping Address"
    label: "Region"
    sql: ${TABLE}.shipping_address_region ;;
  }

  dimension: shipping_address_street_address {
    type: string
    group_label: "Shipping Address"
    label: "Street Address"
    sql: ${TABLE}.shipping_address_street_address ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subscription_id {
    type: number
    hidden: yes
    sql: ${TABLE}.subscription_id ;;
    description: "The value used to identify a specific subscription."
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
    hidden: yes
    description: "A Level 2 data field that specifies the amount of tax that was included in the total transaction amount. It is never negative, and it does not add to the total transaction amount."
  }

  dimension: tax_exempt {
    type: yesno
    sql: ${TABLE}.tax_exempt ;;
    description: "A Level 2 data field that indicates whether or not the transaction should be considered eligible for tax exemption. This does not affect the total transaction amount."
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    description: "The value that defines whether a transaction is a sale or credit."
  }

  dimension: voice_referral_number {
    type: number
    sql: ${TABLE}.voice_referral_number ;;
    description: "The value passed by the merchant with a voice-authorized transaction."
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created_at ;;
    timeframes: [
      raw,
      day_of_week,
      hour_of_day,
      date,
      week,
      week_of_year,
      month,
      quarter,
      day_of_month,
      month_num,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
  }

  dimension: month_linker {
    label: "Created Month"
    description: "This helper dimension provides contextual links to other dashboards."
    type: string
    sql: ${created_month} ;;
    link: {
      label: "Drill into these Transactions"
      url: "/dashboards/708?Date={{value | replace '-', '/'}} for 1 months"
    }
    link: {
      label: "Drill into Declines from this Month"
      url: "/dashboards/716?Date={{value | replace '-', '/'}} for 1 months"
    }
    link: {
      label: "Drill into Disputes from this Month"
      url: "/dashboards/715?Date={{value | replace '-', '/'}} for 1 months"
    }
    link: {
      label: "Drill into At Risk Payments from this Month"
      url: "/dashboards/716?Date={{value | replace '-', '/'}} for 1 months"
    }
  }

  dimension_group: updated {
    type: time
    sql: ${TABLE}.updated_at ;;
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
  }

  dimension_group: today {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      week_of_year,
      day_of_month,
      month,
      quarter,
      year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year
    ]
    sql: CURRENT_TIMESTAMP() ;;
  }

  dimension: tender {
    type: string
    sql: CASE
          WHEN ${credit_card.transaction_id} IS NOT NULL THEN 'Credit Card'
           WHEN ${masterpass_card_details.transaction_id} IS NOT NULL THEN 'MasterPass card'
           WHEN ${paypal_details.transaction_id} IS NOT NULL THEN 'Paypal'
           WHEN ${venmo_details.transaction_id} IS NOT NULL THEN 'Venmo'
           WHEN ${visa_checkout_details.transaction_id} IS NOT NULL THEN 'Visa Checkout'
           WHEN ${apple_pay_card.transaction_id} IS NOT NULL THEN 'Apple Pay'
          WHEN ${android_pay_details.transaction_id} IS NOT NULL THEN 'Android Pay'
          ELSE 'Other' END;;
  }

  dimension: tender_display {
    type: string
    sql: CASE
           WHEN ${transaction.payment_instrument_type} = "credit_card" THEN 'Credit Card'
           WHEN ${transaction.payment_instrument_type} = "masterpass_card" THEN 'MasterPass card'
           WHEN ${transaction.payment_instrument_type} = "paypal_here" THEN 'Paypal'
           WHEN ${transaction.payment_instrument_type} = "paypal_account" THEN 'Paypal'
           WHEN ${transaction.payment_instrument_type} = "venmo_account" THEN 'Venmo'
           WHEN ${transaction.payment_instrument_type} = "visa_checkout_card" THEN 'Visa Checkout'
           WHEN ${transaction.payment_instrument_type} = "apple_pay_card" THEN 'Apple Pay'
           WHEN ${transaction.payment_instrument_type} = "android_pay_card" THEN 'Android Pay'
           WHEN ${transaction.payment_instrument_type} = "samsung_pay_card" THEN 'Samsung Pay'
           WHEN ${transaction.payment_instrument_type} = "us_bank_account" THEN 'US Bank'
          ELSE 'Other' END;;
  }

  dimension: denied {
    type: yesno
    sql: ${status} IN ("SettlementDeclined","GatewayRejected","AuthorizationExpired","ProcessorDeclined","Failed") ;;
  }

  dimension: amount_formatted {
    type: number
    hidden: yes
    sql: CASE WHEN ${type} = 'credit' THEN (-1 * ${amount}) ELSE ${amount} END;;
    value_format_name: usd
  }

  measure: count {
    type: count
    label: "Number of Transactions"
    drill_fields: [detail*]
    value_format_name: decimal_0
  }

  measure: count_declines {
    type: count
    group_label: "Declined Transactions"
    label: "Number of Declines"
    value_format_name: decimal_0
    drill_fields: [detail*]
    filters: {
      field: denied
      value: "yes"
    }
  }

  measure: total_tax {
    type: sum
    sql: ${tax_amount} ;;
    value_format_name: usd
  }

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: total_amount_formatted {
    type: sum
    drill_fields: [detail*]
    sql: ${amount_formatted};;
    value_format_name: usd
  }

  measure: amount_of_decline {
    group_label: "Declined Transactions"
    label: "Declined Transaction Amount"
    type: sum
    sql: ${amount} ;;
    value_format_name: usd
    filters: {
      field: denied
      value: "yes"
    }
    drill_fields: [detail*]
  }

  measure: average_amount {
    label: "Average Transaction"
    type: average
    sql: ${amount} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: cumulative_total {
    type: running_total
    sql: ${total_amount} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: total_service_fee {
    type: sum
    sql: ${service_fee_amount} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      merchant_account.id,
      customer_id,
      payment_instrument_type,
      status,
      created_date,
      updated_date,
      total_amount
    ]
  }
}

# If necessary, uncomment the line below to include explore_source.
# include: "block_braintree_v2.model.lkml"

view: transaction_ndt {
  derived_table: {
    explore_source: transaction {
      column: tender_display {}
      column: count_declines {}
    }
  }
  dimension: tender_display {hidden: yes}
  dimension: count_declines {
    hidden: yes
    label: "Transaction Number of Declines"
    value_format: "#,##0"
    type: number
  }
}
