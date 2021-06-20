class Order < ApplicationRecord
  ORDER_PARAMS = %i(total_price time_checkin time_checkout room_id).freeze

  belongs_to :room
  belongs_to :user

  scope :get_req_orders, -> { where status: 0 }

  enum status: {pending: 0, approved: 1, returned: 2, cancel: 3}
end
