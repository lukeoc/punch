json.array! @cards do |card|
  json.id card.id
  json.consumer_id card.consumer_id
  json.merchant_id card.merchant_id
  json.total card.current_total.round(2)
  json.level card.level
  json.reward_progress card.reward_progress
end