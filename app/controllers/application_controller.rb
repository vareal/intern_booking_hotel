class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    elsif resource.publisher?
      publisher_dashboard_path
    else
      root_url
    end
  end

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name,
        :last_name, :phone_number, :email, :password, :password_confirmation)}
    end
end
