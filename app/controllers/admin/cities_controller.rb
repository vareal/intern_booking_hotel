class Admin::CitiesController < Admin::BaseController
  def index
    @city = City.new
    @cities = City.all.page(params[:page]).per Settings.paginate
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to admin_cities_url
    else
      debugger
      flash[:warning] = "Add city failed"
      render :index
    end
  end

  def update
    @city = City.find(get_id_params)
    if @city.update(city_params)
      redirect_to admin_cities_url
    end
  end

  private
    def city_params
      params.require(:city).permit(:name, :avatar)
    end

    def get_id_params
      params.require(:city).permit(:id)[:id]
    end
end
