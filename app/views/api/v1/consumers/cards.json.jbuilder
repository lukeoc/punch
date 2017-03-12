json.id @consumer.id
json.name @consumer.name
json.email @consumer.email
json.phone @consumer.phone
json.cards @consumer.cards.each do |card|
  json.id card.id
  json.consumer_id card.consumer_id
  json.merchant_id card.merchant_id
  json.merchant_name card.merchant.name
  json.total card.total
  json.level card.level
  json.redeemable card.redeemable
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