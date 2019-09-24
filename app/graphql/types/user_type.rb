module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :username, String, null: false
    field :bio, String, null: true
    field :avatar, String, null: true
    field :tweets, [Types::TweetType], null: true
    field :followers, [Types::FollowType], null: false
    field :followers_count, Integer, null: true
    field :following, [Types::FollowType], null: false
    field :following_count, Integer, null: true


    def followers_count
      object.followers.size
    end

    def following_count
      object.following.size
    end
  end
end
