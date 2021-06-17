class Api::V1::UserpagesController < Api::V1::ApiController
  def home
    @limit_city = City.limit(Settings.homepage.get_city).includes(:rooms)
    json_response @limit_city
  end
end
