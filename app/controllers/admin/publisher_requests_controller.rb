class Admin::PublisherRequestsController < Admin::BaseController
  before_action :get_req_info, only: %i(destroy update)
  before_action :get_req_user, only: :update

  def index
    if current_user.nil? || !current_user.admin?
      redirect_to new_user_session_path
    else
      @req_publishers = PublisherInfo.all.get_req_publishers
    end
  end

  def update
    if @req_user.publisher! && @req_info.saved!
      respond_to :js
    else
      flash[:danger] = t ".approve-failed"
      redirect_to admin_publisher_requests_url
    end
  end

  def destroy
    if @req_info.destroy
      respond_to :js
    else
      flash[:danger] = t ".delete-failed"
      redirect_to admin_publisher_requests_url
    end
  end


  private
    def get_req_user
      @req_user = User.find_by(id: params[:id])
      return if @req_user
      flash[:danger] = t ".user-not-exist"
      redirect_to admin_publisher_requests_path
    end

    def get_req_info
      @req_info = PublisherInfo.find_by(user_id: params[:id])
      return if @req_info
      flash[:danger] = t ".req-not-exist"
      redirect_to admin_publisher_requests_path
    end
end
