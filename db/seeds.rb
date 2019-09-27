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

top_three = []

User.all.each do |user|
  top_three << user
end

def follow_lotto(user, top_three)
  if (0..10).to_a.sample > 2
    top_three.sample.followers << user
  end
  if (0..10).to_a.sample > 6
    user.followers << top_three.sample
  end
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
  puts "Time for the follow_lotto"
  follow_lotto(u, top_three)
end

