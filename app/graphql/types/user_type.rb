module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :username, String, null: false
    field :bio, String, null: true
    field :avatar, String, null: true
    field :tweets, [Types::TweetType], null: true

  end
end
