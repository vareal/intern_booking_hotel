class Room < ApplicationRecord
  has_many :images

  has_many_attached :images

  scope :get_req_rooms, -> { where status: 2 }

  belongs_to :city
  belongs_to :user
  has_one :order

  accepts_nested_attributes_for :images

  #validates :name, presence: true, length: { maximum: Settings.room_model.name_max }
  #validates :price, presence: true
  #validates :description, presence: true, length: { maximum: Settings.room_model.des_max }

  enum status: {openning: 1, pending: 2, using: 3}

  scope :filter_by_city, (lambda do |city_id|
    where city_id: city_id if city_id.present?
  end)
end
