class Order < ApplicationRecord
  ORDER_PARAMS = %i(total_price time_checkin
                    time_checkout room_id coin_using
                    capacity_adult capacity_child).freeze

  belongs_to :room
  belongs_to :user

  has_one :wallet

  before_create :save_order_code, :used_coin
  after_update :update_coind_to_wallet

  scope :get_bills, -> { where("orders.status != 0").order(created_at: :desc) }

  scope :get_room_by_user, ->(user_id){where "rooms.user_id = ?", "#{user_id}"}
  scope :get_from_a_month_ago, -> { where "created_at > ? and
    created_at < ?", 1.months.ago, 0.months.ago }

  enum status: {pending: 0, approved: 1, returned: 2, cancel: 3}

  scope :filter_by_oder, (lambda do |status|
    where status: status if status.present?
  end)

  scope :search_by_code, (lambda do |code|
    where "code LIKE ?", "%#{code}%" if code.present?
  end)

  scope :order_booking, -> {order(created_at: :desc)}

  def update_coind_to_wallet
    return unless self.returned?

    if self.user.wallet.present?
      user.wallet.update(
        coin: self.user.wallet.coin += generate_coin_when_returned_room
      )
    else
      Wallet.create!(
        coin: generate_coin_when_returned_room,
        user_id: self.user.id,
        order_id: self.id
      )
    end
  end

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

  def generate_coin_when_returned_room
    coin = self.total_price.to_i / 100
  end

  def used_coin
    user.wallet.update(
      coin: self.user.wallet.coin -= self.coin_using
    )
  end
end
