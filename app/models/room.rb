class Room < ApplicationRecord
  has_many :images
  belongs_to :city
  belongs_to :user
  accepts_nested_attributes_for :images
    
  validates :name, presence: true, length: { maximum: Settings.room_model.name_max }
  validates :price, presence: true
  validates :description, presence: true, length: { maximum: Settings.room_model.des_max }

  scope :filter_by_city, (lambda do |city_id|
    where city_id: city_id if city_id.present?
  end)
end
