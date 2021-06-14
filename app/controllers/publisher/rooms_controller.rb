class Publisher::RoomsController < Publisher::BaseController
  before_action :find_room, only: :destroy
  
  def index
    @room = Room.new
    @rooms = Room.all.page(params[:page]).per Settings.paginate
    @room.images.build
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success]= t ".publish-success"
      redirect_to publisher_rooms_url
    else
      flash[:danger]= t ".publish-failed"
      redirect_to publisher_rooms_url
    end
  end

  def destroy
    if @room.destroy
      respond_to :js
    else
      flash[:danger]= t ".delete-failed"
      redirect_to publisher_rooms_url
    end
  end

  private
    def find_room
      @room = Room.find_by(id: params[:id])
      return if @room

        flash[:danger] = t ".room-not-exist"
        redirect_to publisher_rooms_url

    end
    
    def room_params
      params.require(:room).permit(:name, :price, :description, 
        :city_id, images: [])
    end
end
