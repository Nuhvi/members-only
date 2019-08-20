10.times do |n|
  name = Faker::Name.name
  email = "user_#{n}@example.com"
  User.create(name: name,
              email: email,
              password: 'password',
              password_confirmation: 'password')
end

10.times do |n|
  user = User.all.sample
  title = Faker::Lorem.unique.sentence
  content = Faker::Lorem.unique.paragraph
  Post.create(title: title,
              content: content,
              user_id: user.id)
end