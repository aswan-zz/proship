class CruiseLinesController < AuthenticationController
  before_action :set_cruise_line, only: [:show, :edit, :update, :destroy]

  # GET /cruise_lines
  # GET /cruise_lines.json
  def index
    @back_link = admin_path
    @cruise_lines = CruiseLine.all
  end

  # GET /cruise_lines/1
  # GET /cruise_lines/1.json
  def show
  end

  # GET /cruise_lines/new
  def new
    @cruise_line = CruiseLine.new
  end

  # GET /cruise_lines/1/edit
  def edit
  end

  # POST /cruise_lines
  # POST /cruise_lines.json
  def create
    @cruise_line = CruiseLine.new(cruise_line_params)

    respond_to do |format|
      if @cruise_line.save
        format.html { redirect_to @cruise_line, notice: 'Cruise line was successfully created.' }
        format.json { render :show, status: :created, location: @cruise_line }
      else
        format.html { render :new }
        format.json { render json: @cruise_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cruise_lines/1
  # PATCH/PUT /cruise_lines/1.json
  def update
    respond_to do |format|
      if @cruise_line.update(cruise_line_params)
        format.html { redirect_to @cruise_line, notice: 'Cruise line was successfully updated.' }
        format.json { render :show, status: :ok, location: @cruise_line }
      else
        format.html { render :edit }
        format.json { render json: @cruise_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cruise_lines/1
  # DELETE /cruise_lines/1.json
  def destroy
    @cruise_line.destroy
    respond_to do |format|
      format.html { redirect_to cruise_lines_url, notice: 'Cruise line was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cruise_line
      @cruise_line = CruiseLine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cruise_line_params
      params.require(:cruise_line).permit(:name, :short_name)
    end
end
