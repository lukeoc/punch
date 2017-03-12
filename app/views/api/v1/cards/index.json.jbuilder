json.array! @cards do |card|
  json.id card.id
  json.consumer_id card.consumer_id
  json.merchant_id card.merchant_id
  json.total card.total
  json.level card.level
end