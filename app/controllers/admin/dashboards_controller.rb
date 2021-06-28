class Admin::DashboardsController < Admin::BaseController
  def index
    @newusers = User.get_from_a_month_ago.count
    @total_of_order = Order.get_from_a_month_ago.count
    @total_of_room = Room.get_room_from_a_month_ago.count
  end
end
