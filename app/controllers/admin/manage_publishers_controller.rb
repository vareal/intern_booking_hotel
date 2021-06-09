class Admin::ManagePublishersController < Admin::BaseController
  def index
    @publishers = User.where(role: 1).page(params[:page]).per Settings.paginate
  end
end
