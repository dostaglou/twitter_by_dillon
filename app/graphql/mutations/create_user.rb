class Mutations::CreateUser < Mutations::BaseMutation
  class AuthProviderSignupData < Types::BaseInputObject
    argument :email, Types::AuthProviderInput, required: false
  end

  argument :username, String, required: true
  # argument :email, String, required: true
  argument :bio, String, required: false
  argument :avatar, String, required: false
  # argument :password, String, required: true

  argument :auth_provider, AuthProviderSignupData, required: false


  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(username:, avatar:, bio:, auth_provider:)
    user = User.new(
            username: username,
            email: auth_provider&.[](:email)&.[](:email),
            password: auth_provider&.[](:email)&.[](:password),
            bio: bio || nil, # not being allowed Comment below for possible solution to required null declaration
            avatar: avatar || nil # not being allowed Comment below for possible solution to required null declaration
            )
    user.skip_confirmation!
    if user.save
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

# def resolve(args = {})
#   to pull what I need as needed
# end
