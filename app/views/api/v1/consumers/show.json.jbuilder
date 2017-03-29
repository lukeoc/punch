
   json.id @consumer.id
  json.name @consumer.name
  json.email @consumer.email
  json.phone @consumer.phone
  json.cards @consumer.cards.each do |card|
    json.id card.id
    json.consumer_id card.consumer_id
    json.merchant_id card.merchant_id
    json.merchant_name card.merchant.name
    json.active_merchant card.merchant.active_merchant
    json.reward_threshold card.merchant.reward_threshold
    json.lat card.merchant.lat
    json.lng card.merchant.lng
    json.reward_name card.merchant.reward_name
    json.image card.merchant.image
    json.total number_with_precision(card.current_total.round(2), precision: 2)
    json.level card.level
    json.reward_progress card.reward_progress
    json.redeemable card.redeemable
    json.transactions card.transactions.each do |transaction|
      json.id transaction.id
      json.amount transaction.amount
    end
  end
  json.transactions @consumer.transactions.each do |transaction|
    json.id transaction.id
    json.consumer_id transaction.consumer_id
    json.merchant_id transaction.merchant_id
    json.card_id transaction.card_id
    json.amount transaction.amount
  end
  json.merchants @consumer.merchants.each do |merchant|
  json.id merchant.id
  json.name merchant.name
  json.email merchant.email
  json.reward_name merchant.reward_name
  json.reward_threshold merchant.reward_threshold
  end