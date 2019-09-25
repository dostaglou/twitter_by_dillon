class Mutations::CreateTweet < Mutations::BaseMutation
  argument :content, String, required: true
  argument :user_id, Integer, required: true

  field :tweet, Types::TweetType, null: false
  field :errors, [String], null: false

  def resolve(content:, user_id:)
    tweet = Tweet.new(
            content: content,
            user_id: user_id
            )
    if tweet.save
      {
        tweet: tweet,
        errors: []
      }
    else
      {
        tweet: nil,
        errors: tweet.errors.full_message
      }
    end
  end
end
