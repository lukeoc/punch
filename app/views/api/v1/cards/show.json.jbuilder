json.id @card.id
json.consumer_id @card.consumer_id
json.merchant_id @card.merchant_id
json.merchant_name @card.merchant.name
json.total @card.total
json.level @card.level
json.redeemable @card.redeemable
json.transactions @card.transactions.each do |transaction|
  json.id transaction.id
  json.consumer_id transaction.consumer_id
  json.merchant_id transaction.merchant_id
  json.card_id transaction.card_id
  json.amount transaction.amount
  json.created_at transaction.created_at
end