class Room < ApplicationRecord
    has_many :images
    accepts_nested_attributes_for :images
    
    validates :name, presence: true, length: { maximum: Settings.room_model.name_max }
    validates :price, presence: true
    validates :description, presence: true, length: { maximum: Settings.room_model.des_max }

end
