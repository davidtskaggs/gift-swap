require 'faker'

Event.delete_all
Admin.delete_all
User.delete_all

thierry = User.create(email: "thierry@gmail.com", password: "123456")
catherine = User.create(email: "catherine@gmail.com", password: "123456")
david = User.create(email: "david@gmail.com", password: "123456")
andres = User.create(email: "andres@gmail.com", password: "123456")

dave = Admin.create(email: "davidtest@test.com", password: 123456)

30.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password(6, 15))
end


e1 = Event.create(name: "Secret Santa", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 1)
e2 = Event.create(name: "Yankee Swap", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 2)
e3 = Event.create(name: "Gift Swap-a-roo", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 4)
e4 = Event.create(name: "Office Secret Santa", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 6)
e5 = Event.create(name: "DBC Secret Santa", description: Faker::Lorem.paragraph(2, false, 4), start_date: Faker::Date.forward(rand(60)), end_date: Faker::Date.backward(rand(15)), suggested_budget: Faker::Number.between(1, 100), creator_id: 8)

p1 = Participation.create(participant_id: 2, event_id: 1)
p2 = Participation.create(participant_id: 3, event_id: 2)
p1 = Participation.create(participant_id: 4, event_id: 3)
p3 = Participation.create(participant_id: 5, event_id: 5)
p4 = Participation.create(participant_id: 4, event_id: 1)
p5 = Participation.create(participant_id: 3, event_id: 2)
p6 = Participation.create(participant_id: 2, event_id: 3)
p7 = Participation.create(participant_id: 1, event_id: 4)
p8 = Participation.create(participant_id: 2, event_id: 1)
p9 = Participation.create(participant_id: 3, event_id: 2)
p10 = Participation.create(participant_id: 4, event_id: 3)
p11 = Participation.create(participant_id: 5, event_id: 5)
p12 = Participation.create(participant_id: 3, event_id: 1)
p13 = Participation.create(participant_id: 3, event_id: 2)
p14 = Participation.create(participant_id: 3, event_id: 3)
p15 = Participation.create(participant_id: 4, event_id: 4)
