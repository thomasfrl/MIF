class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @city = City.find(params[:id])
    @cities = City.all
    def matchmaking(contender)
      arrayuser = []
      arraycontender = []
      value = 0
      current_user.user_preferences.each do |userpref|
        arrayuser << userpref
      end

      contender.user_preferences.each do |contenderpref|
        arraycontender << contenderpref
      end

      if arraycontender.include? arrayuser[0] && arraycontender.include? arrayuser[1] && arraycontender.include? arrayuser[2] && arraycontender.include? arrayuser[3] && arraycontender.include? arrayuser[4]
        value = 5
      elsif arraycontender.include? arrayuser[0] && arraycontender.include? arrayuser[1] && arraycontender.include? arrayuser[2] && arraycontender.include? arrayuser[3]
        value = 4
      elsif arraycontender.include? arrayuser[0] && arraycontender.include? arrayuser[1] && arraycontender.include? arrayuser[2]
        value = 3
      elsif arraycontender.include? arrayuser[0] && arraycontender.include? arrayuser[1]
        value = 2
      elsif arraycontender.include? arrayuser[0]
        value = 1
      end
      return value
    end
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:name, :country, :zip_code)
    end
end
