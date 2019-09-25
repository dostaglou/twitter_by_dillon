module Types
  class QueryType < Types::BaseObject

    field :users, [Types::UserType], null: false
    field :tweets, [Types::TweetType], null: false
    field :follows, [Types::FollowType], null: false
    field :tweet, Types::TweetType, null: false do
      argument :id, ID, required: true
    end
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    field :follow, Types::FollowType, null: false do
      argument :id, ID, required: true
    end

    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end

    def tweets
      Tweet.all
    end

    def tweet(id:)
      Tweet.find(id)
    end

    def follows
      Follow.all
    end

    def follow(id:)
      Follow.find(id)
    end
  end
end
