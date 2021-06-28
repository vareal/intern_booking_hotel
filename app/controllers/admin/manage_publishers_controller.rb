class Admin::ManagePublishersController < Admin::BaseController
  def index
    if current_user.nil? || !current_user.admin?
      redirect_to new_user_session_path
    else
      @publishers = User.get_publishers.page(params[:page]).per Settings.paginate
    end
  end
end
