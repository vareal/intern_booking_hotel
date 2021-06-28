class Publisher::RoomsController < Publisher::BaseController
  before_action :find_room, only: %i(destroy returned)
  before_action :find_room_in, only: :update

  def index
    if current_user.nil? || !current_user.publisher?
      redirect_to new_user_session_path
    else
      @room = Room.new
      @rooms = current_user.rooms.all.page(params[:page]).per Settings.paginate
      @room.images.build
    end
  end

  def update
    if @room.update(room_params)
      redirect_to publisher_rooms_url
    else
      flash[:danger]= t ".update-failed"
      redirect_to publisher_rooms_url
    end
  end

  def returned
    if @room.openning!
      redirect_to publisher_rooms_url
    else
      flash[:danger]= t ".returned-failed"
      redirect_to publisher_rooms_url
    end
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = t ".publish-success"
      redirect_to publisher_rooms_url
    else
      flash[:danger] = t ".publish-failed"
      redirect_to publisher_rooms_url
    end
  end

  def destroy
    if @room.destroy
      respond_to :js
    else
      flash[:danger] = t ".delete-failed"
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

    def find_room_in
      @room = Room.find_by(id: params[:room][:id])
      return if @room
      flash[:danger] = t ".room-not-exist"
      redirect_to publisher_rooms_url
    end

    def room_params
      params.require(:room).permit(:name, :price, :description,
        :city_id, :user_id, images: [])
    end
end
