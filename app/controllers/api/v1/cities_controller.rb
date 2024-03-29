class Api::V1::CitiesController < Api::V1::ApiController
  def index
    @city = City.find_by id: params[:id]
    @rooms = @city.rooms.openning
    json_response @rooms
  end


  def show
    first_city = City.find_by(name: "Hồ Chí Minh")
    params[:city_id] = first_city.id if Room.pluck(:city_id)
                                 .exclude?(params[:city_id].to_i)
    @get_room_from_city = Room.filter_by_city(params[:city_id])
                              .limit Settings.homepage.room.limit
    json_response @get_room_from_city
  end
end
