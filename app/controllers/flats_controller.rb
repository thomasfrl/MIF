class FlatsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flat, only: [:show, :edit, :update]

  # GET /flats/1
  def show
    @flat = Flat.find(params[:id])
  end


  # GET /flats/1/edit
  def edit
    @flat = current_user.flat
  end

  # POST /flats
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
