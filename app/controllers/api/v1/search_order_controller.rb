class Api::V1::SearchOrderController < Api::V1::ApiController
  def index
    @order = current_user.orders.search_by_code params[:code]
    json_response @order
  end
end
