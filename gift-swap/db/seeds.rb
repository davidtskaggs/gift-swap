require 'faker'

Participation.delete_all
Event.delete_all
Admin.delete_all
User.delete_all
Wishlist.delete_all
Gift.delete_all
WishlistItem.delete_all
GiftExchange.delete_all

thierry = User.create(first_name: "Thierry", last_name: "test", email: "thierry@gmail.com", password: "123456")
catherine = User.create(first_name: "Catherine", last_name: "test", email: "catherine@gmail.com", password: "123456")
david = User.create(first_name: "David", last_name: "test", email: "david@gmail.com", password: "123456")
andres = User.create(first_name: "Andres", last_name: "test", email: "andres@gmail.com", password: "123456")

# 30.times do
#   User.create(email: Faker::Internet.email, password: Faker::Internet.password(6, 15))
# end


e1 = Event.create(id: 1, name: "Secret Santa", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 1)
# e2 = Event.create(name: "Yankee Swap", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 2)
# e3 = Event.create(name: "Gift Swap-a-roo", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 4)
# e4 = Event.create(name: "Office Secret Santa", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 6)
# e5 = Event.create(name: "DBC Secret Santa", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 8)
# e6 = Event.create(name: "Secret Hannukah", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 8)

p1 = Participation.create(participant_id: 1, event_id: 1)
p2 = Participation.create(participant_id: 2, event_id: 1)
p3 = Participation.create(participant_id: 3, event_id: 1)
p4 = Participation.create(participant_id: 4, event_id: 1)
# p4 = Participation.create(participant_id: 4, event_id: 1)
# p5 = Participation.create(participant_id: 3, event_id: 2)
# p6 = Participation.create(participant_id: 2, event_id: 3)
# p7 = Participation.create(participant_id: 1, event_id: 4)
# p9 = Participation.create(participant_id: 3, event_id: 2)
# p10 = Participation.create(participant_id: 4, event_id: 3)
# p11 = Participation.create(participant_id: 5, event_id: 5)
# p12 = Participation.create(participant_id: 3, event_id: 1)
# p13 = Participation.create(participant_id: 3, event_id: 2)
# p14 = Participation.create(participant_id: 3, event_id: 3)
# p15 = Participation.create(participant_id: 4, event_id: 4)

w1 = Wishlist.create(name: "thierry's wishlist 1", user_id: thierry.id)
w2 = Wishlist.create(name: "catherine's wishlist 1", user_id: catherine.id)
w3 = Wishlist.create(name: "david's wishlist 1", user_id: david.id)
w4 = Wishlist.create(name: "andres' wishlist1", user_id: andres.id)

g1 = Gift.create(name: "Frying pan", price: 19.99, url: "www.example.com", category: "kitchen")
g2 = Gift.create(name: "Sauce pan", price: 18.99, url: "www.example.com", category: "kitchen")
g3 = Gift.create(name: "Wok pan", price: 20.99, url: "www.example.com", category: "kitchen")
g4 = Gift.create(name: "something pan", price: 17.99, url: "www.example.com", category: " kitchen")

wi1 = WishlistItem.create(wishlist_id: w1.id, gift_id: g1.id)
wi2 = WishlistItem.create(wishlist_id: w2.id, gift_id: g2.id)
wi3 = WishlistItem.create(wishlist_id: w3.id, gift_id: g3.id)
wi4 = WishlistItem.create(wishlidst_id: w4.id, gift_id: g4.id)

ge1 = GiftExchange.create(recipient_id: 1, sender_id: 2, event_id: 1, wishlist_item_id: 1)
ge2 = GiftExchange.create(recipient_id: 2, sender_id: 3, event_id: 1, wishlist_item_id: 1)
ge3 = GiftExchange.create(recipient_id: 3, sender_id: 4, event_id: 1, wishlist_item_id: 1)
ge4 = GiftExchange.create(recipient_id: 4, sender_id: 1, event_id: 1, wishlist_item_id: 1)