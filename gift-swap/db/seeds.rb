require 'faker'

User.delete_all

thierry = User.create(email: "thierry@gmail.com", password: "123456")
catherine = User.create(email: "catherine@gmail.com", password: "123456")
david = User.create(email: "david@gmail.com", password: "123456")
andres = User.create(email: "andres@gmail.com", password: "123456")

30.times do
  User.create(email: Faker::Internet.email, password: Faker::Internet.password(6, 15))
end
