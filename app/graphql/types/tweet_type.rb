module Types
  class TweetType < Types::BaseObject
  field :id, ID, null: false
  field :content, String, null: false
  field :posted_by, Types::UserType, null: true, method: :user
  end
end
