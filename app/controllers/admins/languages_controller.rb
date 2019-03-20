class Admins::LanguagesController < Admins::ApplicationController
  before_action :set_language, only: [:update, :destroy]

  # GET /languages
  def index
    @languages = Language.all
    @language_new = Language.new
  end

  # POST /languages
  def create
    @language = Language.new(language_params)
    if @language.save
      if ! params[:icon].nil?
        @language.icon.attach(params[:icon])
      else
        @language.icon.attach(io: File.open("app/assets/images/flag/default.png"), filename:"default.png")
      end
      redirect_to admins_languages_path, notice: 'Language was successfully created.' 
    else
      flash[:danger] =  'Language was not successfully created.'
      redirect_to admins_languages_path 
    end
  end

  # PATCH/PUT /languages/1
  def update
    if @language.update(language_params)
      if ! params[:icon].nil?
        @language.icon.attach(params[:icon])
      end
      redirect_to admins_languages_path, notice: 'Language was successfully updated.'
    else
      flash[:danger] =  'Language was not successfully updated.'
      redirect_to admins_languages_path
    end
  end

  # DELETE /languages/1
  def destroy
    @language.destroy
    redirect_to admins_languages_path, notice: 'Language was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language
      @language = Language.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def language_params
      params.require(:language).permit(:language)
    end
end
