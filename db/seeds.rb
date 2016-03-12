# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  #To randomize use Devise.friendly_token
  password = '12345678'
  user = User.create(username: Faker::Name.name.parameterize.underscore,
                     email: Faker::Internet.email,
                     password: password)
  rand(20).times do
    user.messages.create(text: Faker::Lorem.paragraph(2)[0,160],
                         created_at: rand(7.days).seconds.ago)
  end
end

100.times do
  user = User.all.sample
  user2 = User.where.not(id: user.id).sample
  user.followers << user2 unless user.followers.reload.include?(user2)
end




