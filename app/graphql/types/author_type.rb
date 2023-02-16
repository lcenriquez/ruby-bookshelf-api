class Types::AuthorType < Types::BaseObject
  description "One author"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :yob, Int, null: false, camelize: false # this is to override JSON's default camelcase syntax
  field :is_alive, Boolean, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false

  field :full_name, String, null: true
  field :full_name_inverse, String, null: true

  def full_name_inverse
    "#{object.last_name} #{object.first_name}"
  end
end