class Order < ApplicationRecord
  ORDER_PARAMS = %i(total_price time_checkin time_checkout room_id).freeze

  belongs_to :room
  belongs_to :user

  before_create :save_order_code

  scope :get_bills, -> { where('status= 1').or(where('status= 2'))
    .or(where('status= 3')).order(created_at: :desc)}

  enum status: {pending: 0, approved: 1, returned: 2, cancel: 3}

  scope :filter_by_oder, (lambda do |status|
    where status: status if status.present?
  end)

  scope :search_by_code, (lambda do |code|
    where "code LIKE ?", "%#{code}%" if code.present?
  end)

  private

  def generate_order_code
    code = [*(0...9)].sample(Settings.random).join
    while Order.find_by code: code
      code = [*(0..9)].sample(Settings.random).join
    end
    code
  end

  def save_order_code
    self.code = generate_order_code
  end
end
