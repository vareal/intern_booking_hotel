class Admin::RegisterRequestsController < Admin::BaseController
  before_action :get_req_room, only: %i(update destroy)

  def index
    @req_rooms = Room.all.get_req_rooms
  end

  def update
    if @req_room.update(status: 1)
      respond_to :js
    else
      flash[:danger]= t ".approve-failed"
      redirect_to admin_register_requests_url
    end
  end

  def destroy
    if @req_room.destroy
      respond_to :js
    else
      flash[:danger]= t ".delete-failed"
      redirect_to admin_register_requests_url
    end
  end

  private
    def get_req_room
      @req_room = Room.find_by(id: params[:id])
      return if @req_room
      flash[:danger] = t ".room-not-exist"
      redirect_to admin_register_requests_url
    end
end
