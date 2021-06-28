class Api::V1::SearchRoomController < Api::V1::ApiController
  def index
    @rooms = params[:q].present? ? Room.openning.search(params[:q]) : []
    json_response @rooms
  end
end
