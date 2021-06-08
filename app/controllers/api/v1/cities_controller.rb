class Api::V1::CitiesController < Api::V1::ApiController
  def show
    params[:city_id] = 16 if Room.pluck(:city_id)
                                 .exclude?(params[:city_id].to_i)
    @get_room_from_city = Room.filter_by_city params[:city_id]
    json_response @get_room_from_city
  end
end
