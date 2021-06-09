class Api::V1::RoomsController < Api::V1::ApiController
  def show
    @room = Room.find_by id: params[:id]
    json_response @room
  end
end
