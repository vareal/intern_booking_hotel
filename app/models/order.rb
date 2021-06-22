class Order < ApplicationRecord
  ORDER_PARAMS = %i(total_price time_checkin
                    time_checkout room_id coin_using).freeze

  belongs_to :room
  belongs_to :user

  has_one :wallet

  before_create :save_order_code, :used_coin
  after_update :update_coind_to_wallet

  scope :get_bills, -> { where('status= 1').or(where('status= 2'))
    .or(where('status= 3')).order(created_at: :desc)}

  enum status: {pending: 0, approved: 1, returned: 2, cancel: 3}

  scope :filter_by_oder, (lambda do |status|
    where status: status if status.present?
  end)

  scope :search_by_code, (lambda do |code|
    where "code LIKE ?", "%#{code}%" if code.present?
  end)

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
