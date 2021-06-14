class CitySerializer < ActiveModel::Serializer
  attributes :id, :avatar ,:name

  has_many :rooms
end
