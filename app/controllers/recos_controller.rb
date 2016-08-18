class RecosController < ApplicationController
  before_action :set_reco, only: [:show, :edit, :update, :destroy]

  # GET /recos
  # GET /recos.json
  def index
    @recos = Reco.all
  end

  # GET /recos/1
  # GET /recos/1.json
  def show
  end

  # GET /recos/new
  def new
    @reco = current_user.recos.build
  end

  # GET /recos/1/edit
  def edit
  end

  # POST /recos
  # POST /recos.json
  def create
    @reco = Reco.new(reco_params)
    @reco.user_id = current_user.id
    respond_to do |format|
      if @reco.save
        format.html { redirect_to @reco, notice: 'Reco was successfully created.' }
        format.json { render :show, status: :created, location: @reco }
      else
        format.html { render :new }
        format.json { render json: @reco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recos/1
  # PATCH/PUT /recos/1.json
  def update
    respond_to do |format|
      if @reco.update(reco_params)
        format.html { redirect_to @reco, notice: 'Reco was successfully updated.' }
        format.json { render :show, status: :ok, location: @reco }
      else
        format.html { render :edit }
        format.json { render json: @reco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recos/1
  # DELETE /recos/1.json
  def destroy
    @reco.destroy
    respond_to do |format|
      format.html { redirect_to recos_url, notice: 'Reco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reco
      @reco = Reco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reco_params
      params.require(:reco).permit(:name, :description, :rating, :address, :latitude, :longitude, :user_id, :category, :day_time, :photo, :weather_type)
    end
end