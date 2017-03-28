json.id @card.id
json.consumer_id @card.consumer_id
json.merchant_id @card.merchant_id
json.merchant_name @card.merchant.name
json.reward_threshold @card.merchant.reward_threshold
json.reward_name @card.merchant.reward_name
json.image @card.merchant.image
json.google_place_id @card.merchant.google_place_id
json.total number_with_precision(@card.current_total.round(2), precision: 2)
json.level @card.level
json.reward_progress @card.reward_progress
json.redeemable @card.redeemable
json.transactions @card.transactions.each do |transaction|
  json.id transaction.id
  json.consumer_id transaction.consumer_id
  json.merchant_id transaction.merchant_id
  json.card_id transaction.card_id
  json.amount transaction.amount
  json.created_at transaction.created_at
end