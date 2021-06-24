class Publisher::PublisherpagesController < Publisher::BaseController
  before_action :get_rooms, only: :index

  def index
    @amount_of_room = @get_rooms.size
    @amount_of_order = @joins_room_order.size
    @amount_of_cancel = @joins_room_order
      .get_cancel_order_by_joins.count
    @total_revenue = @joins_room_order
      .get_from_a_month_ago
      .sum(:total_price)
    @cancel_rate = @amount_of_order == 0 ? 0 :
      (@amount_of_cancel * 100) / @amount_of_order
    @total_revenue /= 1000000.0
  end

  private
    def get_rooms
      @get_rooms = current_user.rooms
      @joins_room_order = @get_rooms.joins(:order)
    end
end
