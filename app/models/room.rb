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

  enum status: {Openning: 1, Pending: 2, Using: 3}

  scope :get_cancel_order_by_joins, -> { where "orders.status= 3" }
  scope :get_from_a_month_ago, -> { where "orders.created_at > ? and
    orders.created_at < ?", 1.months.ago, 0.months.ago }
  scope :filter_by_city, (lambda do |city_id|
    where city_id: city_id if city_id.present?
  end)
end
