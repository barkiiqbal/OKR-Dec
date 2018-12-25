class AsrunsController < ApplicationController
  before_action :set_asrun, only: [:show, :edit, :update, :destroy]

  # GET /asruns
  # GET /asruns.json
  def index
    @asruns = Asrun.all
  end

  # GET /asruns/1
  # GET /asruns/1.json
  def show
  end

  # GET /asruns/new
  def new
    @asrun = Asrun.new
  end

  # GET /asruns/1/edit
  def edit
  end

  # POST /asruns
  # POST /asruns.json
  def create
    @asrun = Asrun.new(asrun_params)

    respond_to do |format|
      if @asrun.save
        format.html { redirect_to @asrun, notice: 'Asrun was successfully created.' }
        format.json { render :show, status: :created, location: @asrun }
      else
        format.html { render :new }
        format.json { render json: @asrun.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asruns/1
  # PATCH/PUT /asruns/1.json
  def update
    respond_to do |format|
      if @asrun.update(asrun_params)
        format.html { redirect_to @asrun, notice: 'Asrun was successfully updated.' }
        format.json { render :show, status: :ok, location: @asrun }
      else
        format.html { render :edit }
        format.json { render json: @asrun.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asruns/1
  # DELETE /asruns/1.json
  def destroy
    @asrun.destroy
    respond_to do |format|
      format.html { redirect_to asruns_url, notice: 'Asrun was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asrun
      @asrun = Asrun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asrun_params
      params.require(:asrun).permit(:name)
    end
end
