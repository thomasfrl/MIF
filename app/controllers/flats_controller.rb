class FlatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  # GET /flats
  # GET /flats.json
  def index
    @flats = Flat.all
  end

  # GET /flats/1
  # GET /flats/1.json
  def show
    @flat = Flat.find(params[:id])
  end

  # GET /flats/new
  def new
    @flat = Flat.new
  end

  # GET /flats/1/edit
  def edit
  end

  # POST /flats
  # POST /flats.json
  def create
    @flat = Flat.new(flat_params)

    respond_to do |format|
      if @flat.save
        format.html { redirect_to @flat, notice: 'Flat was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flats/1
  def update
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to current_user, notice: 'Flat was successfully updated.' }
      else
        format.html { redirect_to :current_user }
      end
    end
  end

  # DELETE /flats/1
  # DELETE /flats/1.json
  def destroy
    @flat.destroy
    respond_to do |format|
      format.html { redirect_to flats_url, notice: 'Flat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flat
      @flat = Flat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flat_params
      params.require(:flat).permit(:user_id, :address, :description, :room, :sleep, :place)
    end
end
