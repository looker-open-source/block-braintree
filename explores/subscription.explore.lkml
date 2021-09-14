include: "/views/*.view"

explore: subscription {
  from: subscription
  fields: [ALL_FIELDS*, -transaction.tender]
  join: transaction {
    sql_on: ${subscription.id} = ${transaction.subscription_id} ;;
    relationship: one_to_many
  }
  join: registered_customer {
    sql_on: ${transaction.customer_id} = ${registered_customer.id};;
    relationship: many_to_one
  }
  join: customer_address {
    sql_on: ${registered_customer.id} = ${customer_address.customer_id} ;;
    relationship: one_to_many
  }
  join: subscription_discount {
    sql_on: ${subscription.id} = ${subscription_discount.subscription_id} ;;
    relationship: one_to_many
  }
  join: subscription_add_on {
    sql_on: ${subscription.id} = ${subscription_add_on.subscription_id} ;;
    relationship: one_to_many
  }
  join: subscription_status_history {
    sql_on: ${subscription.id} = ${subscription_status_history.subscription_id} ;;
    relationship: one_to_many
  }
  join: merchant_account {
    sql_on: ${subscription.merchant_account_id} = ${merchant_account.id} ;;
    relationship: many_to_one
  }


}
