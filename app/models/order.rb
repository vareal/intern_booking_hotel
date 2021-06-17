class Order < ApplicationRecord
  ORDER_PARAMS = %i(total_price time_checkin time_checkout room_id).freeze

  belongs_to :room
  belongs_to :user

  enum status: {pending: 0, approved: 1, returned: 2}
end
