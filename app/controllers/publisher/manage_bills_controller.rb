class Publisher::ManageBillsController < Publisher::BaseController
  def index
    @bills = Order.all.get_bills.page(params[:page]).per Settings.paginate
  end
end
