class City < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: 30}
end
