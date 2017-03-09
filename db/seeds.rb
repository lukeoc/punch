Consumer.destroy_all
Merchant.destroy_all
Card.destroy_all
Transaction.destroy_all

luke = Consumer.create(
  name: "Luke O'Connor", 
  email: "luke@luke.com", 
  password: "123", 
  phone: "5741234567")

eric = Consumer.create(
  name: "Eric Phillips", 
  email: "eric@eric.com", 
  password: "123", 
  phone: "9871234567")

james = Consumer.create(
  name: "James O'Connor",
  email: "james@james.com",
  password: "123",
  phone: "7541234567")

matt = Consumer.create(
  name: "Matt Mulvey",
  email: "matt@matt.com",
  password: "123",
  phone: "2341234567")

nate = Consumer.create(
  name: "Nate Montana",
  email: "nate@nate.com",
  password: "123",
  phone: "4561234567")

nick = Consumer.create(
  name: "Nick Montana",
  email: "nick@nick.com",
  password: "123",
  phone: "4341234567")

consumers = [luke, eric, james, matt, nate, nick]


bobs_donuts = Merchant.create(
  name: "Bob's Donuts", 
  email: "bobs@bobs.com", 
  reward_name: "free donut", 
  reward_threshold: 20)

cafe_brainwash = Merchant.create(
  name: "Cafe Brainwash",
  email: "brainwash@brainwash.com",
  reward_name: "free coffee",
  reward_threshold: 25)

sightglass = Merchant.create(
  name: "Sightglass",
  email: "sightglass@sightglass.com",
  reward_name: "free coffee",
  reward_threshold: 30)

tacko = Merchant.create(
  name: "Tacko",
  email: "tacko@tacko.com",
  reward_name: "free taco",
  reward_threshold: 33)

monaghans = Merchant.create(
  name: "Monaghans",
  email: "monaghans@monaghans.com",
  reward_name: "free brewski",
  reward_threshold: 50)

merchants = [bobs_donuts, cafe_brainwash, sightglass, tacko, monaghans]


consumers.each do |consumer|
  n = 0
  merchants.count.times do
    Card.create(
      consumer_id: consumer.id,
      merchant_id: merchants[n].id,
      total: 10,
      level: 1)
    n+=1
  end
end

cards = Card.all


100.times do
  Transaction.create([
  {
  consumer_id: consumers.sample.id,
  merchant_id: merchants.sample.id,
  card_id: cards.sample.id,
  amount: rand(0.0..10.0).round(2)
  }
])
end
