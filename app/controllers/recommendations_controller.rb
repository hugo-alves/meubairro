class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  # GET /recos
  # GET /recos.json
  def index
    @recommendations = Recommendation.all
    @location = params[:location]
    @recommendations = @recommendations.select { |place| place.bairro.downcase == @location.downcase }
  end

  # GET /recos/1
  # GET /recos/1.json
  def show
  end

  # GET /recos/new
  # RECOS É O MEU CARALHO
  def new
    # raise
    @recommendation = current_user.recommendations.build
    @recommendation.bairro = params[:location]
  end

  # GET /recos/1/edit
  def edit
  end

  # POST /recos
  # POST /recos.json
  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.user_id = current_user.id
    respond_to do |format|
      if @recommendation.save
        format.html { redirect_to user_recommendations_path(current_user), notice: 'Recommendation was successfully created.' }
        format.json { render :show, status: :created, location: @recommendation }
      else
        format.html { render :new }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recos/1
  # PATCH/PUT /recos/1.json
  def update
    respond_to do |format|
      if @recommendation.update(recommendation_params)
        format.html { redirect_to @recommendation, notice: 'Recommendation was successfully updated.' }
        format.json { render :show, status: :ok, location: @recommendation }
      else
        format.html { render :edit }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recos/1
  # DELETE /recos/1.json
  def destroy
    @recommendation.destroy
    respond_to do |format|
      format.html { redirect_to recommendations_url, notice: 'Recommendation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @recommendation = Recommendation.find(params[:id])
    @recommendation.upvote_by current_user
    redirect_to :back
  end
  def downvote
    @recommendation = Recommendation.find(params[:id])
    @recommendation.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recommendation
      @recommendation = Recommendation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recommendation_params
      params.require(:recommendation).permit(:name, :description, :rating, :address, :latitude, :longitude, :user_id, :category, :day_time, :photo, :photo_cache, :weather_type, :bairro)
    end
end
