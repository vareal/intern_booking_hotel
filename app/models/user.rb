class User < ApplicationRecord
  has_many :rooms, dependent: :destroy

  scope :get_publishers, -> { where role: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :avatar, length: {maximum: 250}

  enum role: {user: 0, publisher:1, admin: 2}
end
