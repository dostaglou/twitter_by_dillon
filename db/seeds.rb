User.destroy_all
Tweet.destroy_all
Follow.destroy_all

users = ["Dillon", "Pat", "Orchid"]

users.each do |user|
  u = User.new(
    username: user,
    password: "123123",
    email: "#{user}@#{user}.com",
    bio: nil
    )
  u.skip_confirmation!
  u.save
  puts "#{user} account created"
end

10.times do
  u = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.safe_email,
    password: "123123",
    bio: Faker::Quote.famous_last_words
  )
  u.skip_confirmation!
  u.save!
  (2..5).to_a.sample.times do
    t = Tweet.new( content: Faker::Lorem.paragraph_by_chars(number: 120))
    t.user = u
    t.save!
  end
  puts "#{u.username}'s account created with #{u.tweets.count} tweets"
end
