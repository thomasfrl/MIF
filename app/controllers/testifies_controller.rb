class TestifiesController < ApplicationController
  before_action :set_testify, only: [:show, :edit, :update, :destroy]

  # GET /testifies
  # GET /testifies.json
  def index
    @testifies = Testify.all
  end

  # GET /testifies/1
  # GET /testifies/1.json
  def show
  end

  # GET /testifies/new
  def new
    @testify = Testify.new
  end

  # GET /testifies/1/edit
  def edit
  end

  # POST /testifies
  # POST /testifies.json
  def create
    @testify = Testify.new(testify_params)

    respond_to do |format|
      if @testify.save
        format.html { redirect_to @testify, notice: 'Testify was successfully created.' }
        format.json { render :show, status: :created, location: @testify }
      else
        format.html { render :new }
        format.json { render json: @testify.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testifies/1
  # PATCH/PUT /testifies/1.json
  def update
    respond_to do |format|
      if @testify.update(testify_params)
        format.html { redirect_to @testify, notice: 'Testify was successfully updated.' }
        format.json { render :show, status: :ok, location: @testify }
      else
        format.html { render :edit }
        format.json { render json: @testify.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testifies/1
  # DELETE /testifies/1.json
  def destroy
    @testify.destroy
    respond_to do |format|
      format.html { redirect_to testifies_url, notice: 'Testify was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testify
      @testify = Testify.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testify_params
      params.require(:testify).permit(:user_id, :content, :accepted)
    end
end
