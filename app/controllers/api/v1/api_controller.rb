class Api::V1::ApiController < ActionController::API
  include ResponseFormat

  def current_user_api
    @current_user = current_user
    json_response @current_user
  end

  def user_login
    json_response user_signed_in?
  end
end
