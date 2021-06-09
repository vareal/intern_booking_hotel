class Admin::CitiesController < Admin::BaseController
  before_action :get_city, only: :update
  def index
    @city = City.new
    @cities = City.all.page(params[:page]).per Settings.paginate
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to admin_cities_url
    else
      flash[:warning] = "Add city failed"
      redirect_to admin_cities_url
    end
  end

  def update
    if @city.update(city_params)
      redirect_to admin_cities_url
    end
  end

  private
    def city_params
      params.require(:city).permit(:name, :avatar)
    end

    def get_city
      @city = City.find_by(id: params.require(:city).permit(:id)[:id])
      return if @city
      flash[:danger] = "City not exist"
      redirect_to admin_cities_url

    end
end
