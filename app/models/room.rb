class Room < ApplicationRecord
    has_many :images
    accepts_nested_attributes_for :images
    
    validates :name, presence: true, length: { maximum: 80 }
    validates :price, presence: true
    validates :description, presence: true, length: { maximum: 250 }

end
