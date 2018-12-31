class AsRunsController < ApplicationController
  before_action :set_as_run, only: [:show, :edit, :update, :destroy]


  # GET /as_runs
  # GET /as_runs.json
  def index
    @as_runs = AsRun.all
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
    puts as_run

    puts as_run.name
    puts as_run.attachment_url

    fileName = "http://localhost:3000" + as_run.attachment_url
    # http://localhost:3000/uploads/as_run/attachment/15/17-05-22FIOSL.asr
    arrayFile = IO.readlines(Rails.root.join 'public', 'uploads', 'as_run', 'attachment','15', '17-05-22FIOSL.asr')
    puts arrayFile
    arrayFile.each do |line|
      lineToArray = line.gsub(/\s\s+/m, '--**--').strip.split("--**--")
      mcvsValue = lineToArray[4]

      puts lineToArray
      if lineToArray[5] == "NONE"


      else

        lineToArray.insert(5, lineToArray[5])
      end

      puts lineToArray

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

                c11: lineToArray[8],
                c12: lineToArray[8],
                c13: lineToArray[8],
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
