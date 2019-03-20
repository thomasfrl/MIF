class Admins::CitiesController < Admins::ApplicationController
  before_action :set_city, only: [:update]

  # GET /cities
  def index
    @cities = City.all
    @city_new = City.new
  end

  # POST /cities
  def create
    @city = City.new(city_params)
    if @city.save
      if ! params[:picture].nil?
        @city.picture.attach(params[:picture])
      else
        @city.picture.attach(io: File.open("app/assets/images/cities/amsterdam.jpg"), filename:"amsterdam.jpg")
      end
      redirect_to admins_cities_path, notice: 'City was successfully created.' 
    else
      flash[:danger] =  'City was not successfully created.'
      redirect_to admins_cities_path 
    end
  end

  # PATCH/PUT /cities/1
  def update
    if @city.update(city_params)
      if ! params[:picture].nil?
        @city.picture.attach(params[:picture])
      end
      redirect_to admins_cities_path, notice: 'City was successfully updated.' 
    else
      flash[:danger] =  'City was not successfully updated.'
      redirect_to admins_cities_path 
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name, :country, :zip_code, :description)
    end
end
