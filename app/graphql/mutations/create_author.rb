class Mutations::CreateAuthor < GraphQL::Schema::Mutation
  null true

  argument :author, Types::AuthorInputType, required: true

  def resolve(author:)
    Author.create(author.to_h) # Convert to a hash so that ActiveRecord understands it
  end
end