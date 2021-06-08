class Publisher::RoomsController < Publisher::BaseController

  def index
    @room = Room.new
    @rooms = Room.all.page(params[:page]).per Settings.paginate
    @room.images.build
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to publisher_rooms_url
    else
      flash[:warning]="publish failed"
      render :index
    end
  end

  private
    def room_params
      params.require(:room).permit(:name ,:price ,:description, 
        images_attributes: [:link])
    end
end
