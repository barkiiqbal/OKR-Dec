class AsRunsController < ApplicationController
  before_action :set_as_run, only: [:show, :edit, :update, :destroy]

  include AsRunsHelper

  # GET /as_runs
  # GET /as_runs.json
  def index
    @as_runs = AsRun.all

  end

  # GET /as_runs/1
  # GET /as_runs/1.json
  def show
  end

  def download_excel
    as_run_download = AsRun.find_by_id(params[:as_run_id])
    if as_run_download != nil
      exportFileToSheet as_run_download
    end
  end

  # GET /as_runs/new
  def new
    @as_run = AsRun.new
  end

  # GET /as_runs/1/edit
  def edit
  end


  # POST /as_runs
  # POST /as_runs.json
  def create
    @as_run = AsRun.new(as_run_params)

    puts @as_run.name

    respond_to do |format|
      if @as_run.save

        @as_run.attachment

        saveFileDetail @as_run

        format.html { redirect_to @as_run, notice: 'As run was successfully created.' }
        format.json { render :show, status: :created, location: @as_run }
      else
        format.html { render :new }
        format.json { render json: @as_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /as_runs/1
  # PATCH/PUT /as_runs/1.json
  def update
    respond_to do |format|
      if @as_run.update(as_run_params)
        format.html { redirect_to @as_run, notice: 'As run was successfully updated.' }
        format.json { render :show, status: :ok, location: @as_run }
      else
        format.html { render :edit }
        format.json { render json: @as_run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /as_runs/1
  # DELETE /as_runs/1.json
  def destroy
    @as_run.destroy
    filePath = get_file_path @as_run.attachment_url
    File.delete(filePath) if File.exist?(filePath)
    respond_to do |format|
      format.html { redirect_to as_runs_url, notice: 'As run was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_as_run
      @as_run = AsRun.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def as_run_params
      params.require(:as_run).permit(:name, :attachment)
    end
end
