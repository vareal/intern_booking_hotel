class Room < ApplicationRecord
  belongs_to :city

  scope :filter_by_city, (lambda do |city_id|
    where city_id: city_id if city_id.present?
  end)
end
