module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false, description: "An example field added by Luis" do
      argument :name, String, required: true
    end
    def test_field(name: String)
      Rails.logger.info context[:time]
      "Hello #{name}"
    end

    field :author, Types::AuthorType, null: true, description: "Return one author instance by id" do
      argument :id, ID, required: true
    end

    def author(id: ID)
      Author.where(id: id).first
    end

    field :authors, [Types::AuthorType], null: false, description: "Returns a list of all authors in the bookshelf"

    def authors
      Author.all
    end

    field :login, String, null: true, description: "User sign in" do
      argument :email, String, required: true
      argument :password, String, required: true
    end

    def login(email:, password:)
      if (user = User.where(email: email).first&.authenticate(password))
        user.sessions.create.key
      end
    end

    field :current_user, Types::UserType, null: true, description: "The current logged in user"

    def current_user
      context[:current_user]
    end

    field :logout, Boolean, description: "Log a user out"

    def logout
      Session.where(id: context[:session_id]).destroy_all
    end
  end
end
