class Api::V1::OrdersController < Api::V1::ApiController
  def create
    order = current_user.orders.build order_params
    order.save
  end

  private

  def order_params
    params.require(:order).permit Order::ORDER_PARAMS
  end
end
