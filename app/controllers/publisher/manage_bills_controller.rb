class Publisher::ManageBillsController < Publisher::BaseController
  def index
    if current_user.nil? || !current_user.publisher?
      redirect_to new_user_session_path
    else
      @bills = Order.joins(:room).get_room_by_user(current_user.id)
        .get_bills.page(params[:page]).per Settings.paginate
    end
  end
end
