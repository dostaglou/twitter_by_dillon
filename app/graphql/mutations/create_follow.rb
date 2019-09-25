class Mutations::CreateFollow < Mutations::BaseMutation
  argument :asker, ID, required: true
  argument :receiver, ID, required: true

  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(receiver:, asker:)
    user = User.find(receiver)
    follower = User.find(asker)
    if user.followers << follower
      {
        user: user,
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
