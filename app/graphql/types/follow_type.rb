module Types
  class FollowType < Types::BaseObject
    field :id, ID, null: false
    field :following, ID, null: false
    field :follower, ID, null: false
  end
end
