class Admin::RegisterRequestsController < Admin::BaseController
  before_action :get_reqRoom, only: %i(update destroy)

  def index
    @reqRooms = Room.all.get_req_rooms
  end

  def update
    if @reqRoom.update(status: 1)
      respond_to :js
    else
      flash[:danger]= t ".approve-failed"
      redirect_to admin_register_requests_url
    end
  end

  def destroy
    if @reqRoom.destroy
      respond_to :js
    else
      flash[:danger]= t ".delete-failed"
      redirect_to admin_register_requests_url
    end
  end

  private
    def get_reqRoom
      @reqRoom = Room.find_by(id: params[:id])
      return if @reqRoom
      flash[:danger] = t ".room-not-exist"
      redirect_to admin_register_requests_url
    end
end
