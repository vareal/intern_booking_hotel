class City < ApplicationRecord
  has_many :rooms, dependent: :destroy

  has_one_attached :image

  validates :name, presence: true,
    length: {maximum:Settings.valid.city.name.length}
end
