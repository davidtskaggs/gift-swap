require 'faker'

GiftExchange.delete_all
WishlistItem.delete_all
Gift.delete_all
Wishlist.delete_all
Participation.delete_all
Event.delete_all
Admin.delete_all
User.delete_all

thierry = User.create(first_name: "Thierry", last_name: "Moudiki", email: "t@gmail.com", password: "dbc123")
catherine = User.create(first_name: "Catherine", last_name: "Rice", email: "c@gmail.com", password: "dbc123")
david = User.create(first_name: "David", last_name: "Skaggs", email: "d@gmail.com", password: "dbc123")
andres = User.create(first_name: "Andres", last_name: "Arias", email: "a@gmail.com", password: "dbc123")

# 30.times do
#   User.create(email: Faker::Internet.email, password: Faker::Internet.password(6, 15))
# end


e1 = Event.create(id: 1, name: "Secret Santa", description: Faker::TheFreshPrinceOfBelAir.quote, start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 1)
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

w1 = Wishlist.create(name: "Thierry's Wishlist 1", user_id: thierry.id)
w2 = Wishlist.create(name: "Catherine's Wishlist 1", user_id: catherine.id)
w3 = Wishlist.create(name: "David's Wishlist 1", user_id: david.id)
w4 = Wishlist.create(name: "Andres' Wishlist1", user_id: andres.id)

g1 = Gift.create(name: "Frying pan", price: 19.99, url: "https://www.amazon.com/dp/B06XNZDHHC/ref=sxts_hf_cd_wl_1?pf_rd_m=ATVPDKIKX0DER&pf_rd_p=3313742702&pd_rd_wg=ApJUM&pf_rd_r=QTEC7JB29HEJG99SZBNJ&pf_rd_s=desktop-sx-top-slot&pf_rd_t=301&pd_rd_i=B06XNZDHHC&pd_rd_w=Q0NsA&pf_rd_i=frying+pan&pd_rd_r=e77f98c1-0d41-46fc-9f06-01e09d4266a4&ie=UTF8&qid=1510850009&sr=1", category: "kitchen")
g2 = Gift.create(name: "Sauce pan", price: 18.99, url: "https://www.amazon.com/dp/B06XNZDHHC/ref=sxts_hf_cd_wl_1?pf_rd_m=ATVPDKIKX0DER&pf_rd_p=3313742702&pd_rd_wg=ApJUM&pf_rd_r=QTEC7JB29HEJG99SZBNJ&pf_rd_s=desktop-sx-top-slot&pf_rd_t=301&pd_rd_i=B06XNZDHHC&pd_rd_w=Q0NsA&pf_rd_i=frying+pan&pd_rd_r=e77f98c1-0d41-46fc-9f06-01e09d4266a4&ie=UTF8&qid=1510850009&sr=1", category: "kitchen")
g3 = Gift.create(name: "Wok pan", price: 20.99, url: "https://www.amazon.com/dp/B06XNZDHHC/ref=sxts_hf_cd_wl_1?pf_rd_m=ATVPDKIKX0DER&pf_rd_p=3313742702&pd_rd_wg=ApJUM&pf_rd_r=QTEC7JB29HEJG99SZBNJ&pf_rd_s=desktop-sx-top-slot&pf_rd_t=301&pd_rd_i=B06XNZDHHC&pd_rd_w=Q0NsA&pf_rd_i=frying+pan&pd_rd_r=e77f98c1-0d41-46fc-9f06-01e09d4266a4&ie=UTF8&qid=1510850009&sr=1", category: "kitchen")
g4 = Gift.create(name: "pan", price: 17.99, url: "https://www.amazon.com/dp/B06XNZDHHC/ref=sxts_hf_cd_wl_1?pf_rd_m=ATVPDKIKX0DER&pf_rd_p=3313742702&pd_rd_wg=ApJUM&pf_rd_r=QTEC7JB29HEJG99SZBNJ&pf_rd_s=desktop-sx-top-slot&pf_rd_t=301&pd_rd_i=B06XNZDHHC&pd_rd_w=Q0NsA&pf_rd_i=frying+pan&pd_rd_r=e77f98c1-0d41-46fc-9f06-01e09d4266a4&ie=UTF8&qid=1510850009&sr=1", category: " kitchen")
g5 = Gift.create(name: "camera", price: 476.00, url: "https://www.amazon.com/Nikon-D3300-Camera-18-55mm-Bundle/dp/B00II8TQ2E/ref=sr_1_1_sspa?s=electronics&ie=UTF8&qid=1510851619&sr=1-1-spons&keywords=camera&psc=1", category: "photography")
g6 = Gift.create(name: "french press", price: 39.97, url: "https://www.amazon.com/Bodum-Chambord-French-Coffee-Chrome/dp/B005ADS5TU/ref=sr_1_1_sspa?s=home-garden&ie=UTF8&qid=1510851795&sr=1-1-spons&keywords=french+press&psc=1", category: "culinary")

wi1_1 = WishlistItem.create(wishlist_id: w1.id, gift_id: g1.id)
wi2_1 = WishlistItem.create(wishlist_id: w2.id, gift_id: g2.id)
wi3_1 = WishlistItem.create(wishlist_id: w3.id, gift_id: g3.id)
wi1_2 = WishlistItem.create(wishlist_id: w4.id, gift_id: g4.id)



ge1 = GiftExchange.create(recipient_id: 1, sender_id: 4, event_id: 1, wishlist_item_id: 1)
ge2 = GiftExchange.create(recipient_id: 3, sender_id: 2, event_id: 1, wishlist_item_id: 1)
ge3 = GiftExchange.create(recipient_id: 4, sender_id: 3, event_id: 1, wishlist_item_id: 1)
ge4 = GiftExchange.create(recipient_id: 2, sender_id: 1, event_id: 1, wishlist_item_id: 1)