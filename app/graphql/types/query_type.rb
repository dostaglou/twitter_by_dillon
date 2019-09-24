module Types
  class QueryType < Types::BaseObject

    field :users,
      [Types::UserType],
      null: false,
      description: "returns a list of users in the db"

    def users
      User.all
    end

  end
end
