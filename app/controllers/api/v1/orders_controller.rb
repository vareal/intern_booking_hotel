class Api::V1::OrdersController < Api::V1::ApiController
  def index
    @orders = current_user.orders.filter_by_oder params[:status]
    json_response @orders
  end

  def create
    order = current_user.orders.build order_params
    if order.save
      msg = { status: t("message.order.status_ok"),
        message:  t("message.order.sucssess") }
      json_response order
    else
      msg = { status: t("message.order.status_not"),
        message:  t("message.order.danger") }
    end
    json_response msg
  end

  private

  def order_params
    params.require(:order).permit Order::ORDER_PARAMS
  end
end
