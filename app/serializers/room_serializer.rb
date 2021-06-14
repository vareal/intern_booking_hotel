class RoomSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :capacity_adult_person,
    :capacity_child_person

  belongs_to :city
end
