class Mutations::CreateTweet < Mutations::BaseMutation
  argument :content, String, required: true
  # argument :user_id, Integer, required: true

  field :tweet, Types::TweetType, null: false
  field :errors, [String], null: false

  def resolve(content:)
    tweet = Tweet.new(
            content: content,
            user: context[:current_user]
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
