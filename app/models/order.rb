class Order < ApplicationRecord
  ORDER_PARAMS = %i(total_price time_checkin time_checkout room_id).freeze

  belongs_to :room
  belongs_to :user

  enum status: {approved: 0, returned: 1, canceled: 2}

  scope :filter_by_oder, (lambda do |status|
    where status: status if status.present?
  end)
end
