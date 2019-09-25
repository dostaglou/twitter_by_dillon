module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :username, String, null: false
    field :bio, String, null: true
    field :avatar, String, null: true

    field :tweets, [Types::TweetType], null: true

    field :followers_count, Integer, null: true
    field :follower_accounts, [Types::UserType], null: true

    field :following_count, Integer, null: true
    field :following_accounts, [Types::UserType], null: true

    def followers_count
      object.followers.size
    end

    def following_count
      object.following.size
    end

    def following_accounts
      object.following
    end

    def follower_accounts
      object.followers
    end

  end
end
