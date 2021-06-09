class Room < ApplicationRecord
  has_many :images
  belongs_to :city
  accepts_nested_attributes_for :images
  
  validates :name, presence: true, length: { maximum: Settings.room_model.name_max }
  validates :price, presence: true
  validates :description, presence: true, length: { maximum: Settings.room_model.des_max }

  enum status: {Openning: 1, Pending: 2, Using: 3}
end
