10.times do |n|
  name = "user_#{n}"
  email = "user_#{n}@example.com"
  User.create(name: name,
              email: email,
              password: 'password',
              password_confirmation: 'password')
end