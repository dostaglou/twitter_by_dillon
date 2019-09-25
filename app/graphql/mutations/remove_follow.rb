class Mutations::RemoveFollow < Mutations::BaseMutation
  argument :active_user, ID, required: true
  argument :passive_user, ID, required: true


  field :active, Types::UserType, null: false
  field :passive, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(passive_user:, active_user:)
    active = User.find(active_user)
    passive = User.find(passive_user)
    if active.unfollow(passive.id)
      {
        active: active,
        passive: passive,
        errors: []
      }
    else
      {
        user: nil,
        errors: user.errors.full_message
      }
    end
  end
end
