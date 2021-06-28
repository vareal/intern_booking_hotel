class Publisher::RegisterController < ApplicationController
  layout "layouts/devise/register_publisher"

  def new
    @publisher_info = PublisherInfo.new
  end

  def create
    @publisher_info = PublisherInfo.new(get_info)
    if @publisher_info.save
      redirect_to publisher_register_path
    end
  end

  private
    def get_info
      params.require(:publisher_info).permit(:address, :age, :gender,
        :user_id, :survey_quest)
    end
end
