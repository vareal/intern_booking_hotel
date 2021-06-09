class Publisher::RoomsController < Publisher::BaseController

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

  private
    def room_params
      params.require(:room).permit(:name, :price, :description,
        :city_id, images_attributes: [:link])
    end
end
