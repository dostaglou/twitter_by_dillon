module Types
  class TweetType < Types::BaseObject
  field :id, ID, null: false
  field :content, String, null: false
  field :user_id, ID, null: false

  end
end
