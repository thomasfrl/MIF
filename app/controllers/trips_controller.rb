class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @correspondances = current_user.correspondances
    @trips = []
    @correspondances.each do |c|
      @trips << c.trips
    end
    @visitor = current_user
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new

    @conversation = Conversation.find(params[:conversation_id])
    @correspondance = Correspondance.select(current_user, @conversation.other_participant(current_user))
    respond_to do |format|
      format.html{}
      format.js{}
    end

  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to current_user, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { redirect_to current_user, notice: "Trip can't be created" }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    @trip = Trip.find(params[:id])
    if params[:update]
      validated = true
    elsif
      validated = nil
    end
    if @trip.update(validated: validated)
      if validated == true
        redirect_to current_user, notice: 'Success of acceptance of correspondance status'
      elsif validated == nil
        redirect_to current_user, notice: 'Success of refusal of correspondance status'
      end
    else
      flash[:danger] = 'Failure of modification of correspondance status.'
      redirect_to current_user
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user, anchor: '#demo-2-3'), notice: 'Trip was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:correspondance_id, :host_id, :duration, :start_date, :validated)
    end
end
