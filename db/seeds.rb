Consumer.destroy_all
Merchant.destroy_all
Card.destroy_all
Transaction.destroy_all

luke = Consumer.create(
  name: "Luke O'Connor", 
  email: "luke@luke.com", 
  password: "123", 
  phone: "5742765882")

eric = Consumer.create(
  name: "Eric Phillips", 
  email: "eric@eric.com", 
  password: "123", 
  phone: "5742765882")

james = Consumer.create(
  name: "James O'Connor",
  email: "james@james.com",
  password: "123",
  phone: "5742765882")

matt = Consumer.create(
  name: "Matt Mulvey",
  email: "matt@matt.com",
  password: "123",
  phone: "5742765882")

nate = Consumer.create(
  name: "Nate Montana",
  email: "nate@nate.com",
  password: "123",
  phone: "5742765882")

nick = Consumer.create(
  name: "Nick Montana",
  email: "nick@nick.com",
  password: "123",
  phone: "5742765882")

consumers = [luke, eric, james, matt, nate, nick]


bobs_donuts = Merchant.create(
  name: "Bob's Donuts", 
  email: "bobs@bobs.com", 
  reward_name: "free donut", 
  reward_threshold: 20,
  active_merchant: true,
  lat:0,
  lng:0)

cafe_brainwash = Merchant.create(
  name: "Cafe Brainwash",
  email: "brainwash@brainwash.com",
  reward_name: "free coffee",
  reward_threshold: 25,
  active_merchant: true,
  lat:0,
  lng:0)

sightglass = Merchant.create(
  name: "Sightglass",
  email: "sightglass@sightglass.com",
  reward_name: "free coffee",
  reward_threshold: 75,
  active_merchant: true,
  lat:0,
  lng:0)

tacko = Merchant.create(
  name: "Tacko",
  email: "tacko@tacko.com",
  reward_name: "free taco",
  reward_threshold: 50,
  active_merchant: true,
  lat:0,
  lng:0)

monaghans = Merchant.create(
  name: "Monaghans",
  email: "monaghans@monaghans.com",
  reward_name: "free brewski",
  reward_threshold: 150,
  active_merchant: true,
  lat:0,
  lng:0)

cheese_plus = Merchant.create(
name: "Cheese Plus",
email: "cheese@cheese.com",
reward_name: "",
reward_threshold: 60,
active_merchant: false,
lat:0,
lng:0)

marengo = Merchant.create(
name: "Marengo",
email: "marengo@marengo.com",
reward_name: "",
reward_threshold: 100,
active_merchant: false,
lat:0,
lng:0)

merchants = [bobs_donuts, cafe_brainwash, sightglass, tacko, monaghans, cheese_plus, marengo]


consumers.each do |consumer|
  n = 0
  merchants.count.times do
    Card.create(
      consumer_id: consumer.id,
      merchant_id: merchants[n].id,
      total: 0,
      level: rand(1..10),
      lat: merchants[n].lat,
      lng: merchants[n].lng)
    n+=1
  end
end

cards = Card.all

cards.each do |card|
rand(2..10).times do
  Transaction.create([
  {
  consumer_id: card.consumer_id,
  card_id: card.id,
  merchant_id: card.merchant_id,
  amount: rand(0.0..10.0).round(2)
  }
])
end
end



