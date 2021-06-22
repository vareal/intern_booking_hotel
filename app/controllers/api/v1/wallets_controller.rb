class Api::V1::WalletsController < Api::V1::ApiController
  def index
    coins = current_user.user_coin
    json_response coins
  end
end
