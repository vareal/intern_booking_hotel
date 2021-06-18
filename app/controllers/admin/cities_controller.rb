class Admin::CitiesController < Admin::BaseController
  before_action :get_city, only: :update
  before_action :find_city, only: :destroy

  def index
    @city = City.new
    @cities = City.page(params[:page]).per Settings.paginate
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to admin_cities_url
    else
      flash[:warning] = t ".add-city-failed"
      redirect_to admin_cities_url
    end
  end

  def update
    if @city.update(city_params)
      redirect_to admin_cities_url
    else
      flash[:danger]= t ".update-failed"
      redirect_to publisher_rooms_url
    end
  end

  def destroy
    if @city.destroy
      respond_to :js
    else
      flash[:danger]= t ".delete-failed"
      redirect_to publisher_rooms_url
    end
  end

  private
    def city_params
      params.require(:city).permit(:name, :image)
    end

    def find_city
      @city = City.find_by(id: params[:id])
      return if @city
      flash[:danger] = t ".city-not-exist"
      redirect_to admin_cities_url
    end

    def get_city
      @city = City.find_by(id: params[:city][:id])
      return if @city
      flash[:danger] = t ".city-not-exist"
      redirect_to admin_cities_url
    end
end
