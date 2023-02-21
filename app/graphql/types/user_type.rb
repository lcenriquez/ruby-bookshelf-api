class Types::UserType < Types::BaseObject
  description "A user"

  field :id, ID, null: true
  field :email, String, null: true
  field :is_superadmin, Boolean, null: true

  def self.visible?(context)
    # This will hide all fields that return UserType in the schema.
    # For example: when we log out, the CurrentUser query will no longer work.
    # This is because the current_user query will not be accessible
    !!context[:current_user]
  end
end