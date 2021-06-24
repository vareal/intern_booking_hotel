class Publisher::BookingRequestsController < Publisher::BaseController
  before_action :get_req_order, only: %i(update destroy)

  def index
    @req_orders = Order.pending
  end

  def update
    if @req_order.approved!
      respond_to :js
    else
      flash[:danger]= t ".approve-failed"
      redirect_to publisher_booking_requests_url
    end
  end

  def destroy
    if @req_order.cancel!
      respond_to :js
    else
      flash[:danger]= t ".cancel-failed"
      redirect_to publisher_booking_requests_url
    end
  end

  private
    def get_req_order
      @req_order = Order.find_by(id: params[:id])
      return if @req_order
      flash[:danger] = t ".not-found-request"
      redirect_to publisher_booking_requests_url
    end
end
