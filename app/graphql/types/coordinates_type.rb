class Types::CoordinatesType < Types::BaseObject
  field :latitude, Float, null: true
  field :longitude, Float, null: true

  def latitude
    object.last
  end

  def longitude
    object.first
  end
end