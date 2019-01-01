class AsRunsController < ApplicationController
  before_action :set_as_run, only: [:show, :edit, :update, :destroy]

  include AsRunsHelper

  # GET /as_runs
  # GET /as_runs.json
  def index
    @as_runs = AsRun.all
    exportFileToSheet @as_runs.first
  end

  # GET /as_runs/1
  # GET /as_runs/1.json
  def show
  end

  def open_attachment

  end
  # GET /as_runs/new
  def new
    @as_run = AsRun.new

  end

  # GET /as_runs/1/edit
  def edit
  end

  def saveFileDetail as_run

    filePath = get_file_path as_run.attachment_url
    arrayFile = IO.readlines(filePath)

    arrayFile.each do |line|

      lineToArray = line.gsub(/\s\s+/m, '--**--').strip.split("--**--")

      if lineToArray[5] != "NONE"

        lineToArray.insert(5, "")
      end

      if lineToArray.length == 8
          split6 = lineToArray[7].split(' ')
          if split6.length == 2
            lineToArray[7] = split6[0]
            lineToArray << split6[1]
          end
      end

      if lineToArray[8] == nil
        puts lineToArray[8]
      end

      # if lineToArray[8] != nil

        lastItem = lineToArray.length - 1
        if lineToArray[lastItem].length == 13
          c11Value = ''
          c12Value = lineToArray[lastItem].slice(0...11)
          c13Value = lineToArray[lastItem].slice(11...lineToArray[lastItem].length)
        else
          c11Value = lineToArray[lastItem].slice(0...11)
          c12Value = lineToArray[lastItem].slice(11...22)
          c13Value = lineToArray[lastItem].slice(22...lineToArray[lastItem].length)
        end
      # end



      params = {c1: lineToArray[0].to_i,

                c2: lineToArray[1].slice(0...10),
                c3: lineToArray[1].slice(10...21),
                c4: lineToArray[1].slice(21...lineToArray[1].length),

                c5: lineToArray[2],
                c6: lineToArray[3],

                # mcvs none
                c7: lineToArray[4],
                c8: lineToArray[5],

                c9: lineToArray[6],
                c10: lineToArray[7],

                c11: c11Value,
                c12: c12Value,
                c13: c13Value,
                as_run_id: as_run.id
                }


      logs = Log.create(params)
      logs.save
    end

    puts arrayFile
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
