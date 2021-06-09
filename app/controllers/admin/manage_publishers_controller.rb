class Admin::ManagePublishersController < Admin::BaseController
  def index
    @publishers = User.get_publishers.page(params[:page]).per Settings.paginate
  end
end
