class Order < ApplicationRecord
  ORDER_PARAMS = %i(total_price time_checkin time_checkout room_id).freeze

  belongs_to :room
  belongs_to :user

  scope :get_bills, -> { where('status= 1').or(where('status= 2'))
    .or(where('status= 3')).order(created_at: :desc)}

  enum status: {pending: 0, approved: 1, returned: 2, cancel: 3}

  scope :filter_by_oder, (lambda do |status|
    where status: status if status.present?
  end)
end
