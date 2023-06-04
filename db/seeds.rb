50.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  password_confirmation = "password"
  image = open("./public/uploads/sample.png"),
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password_confirmation,
               image: open("./public/uploads/sample.png"),
               )
end