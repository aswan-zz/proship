class AvailabilityTypesController < AuthenticationController
  before_action :set_availability_type, only: [:show, :edit, :update, :destroy]
  
  # GET /availability_types
  # GET /availability_types.json
  def index
    @back_link = admin_path
    @availability_types = AvailabilityType.all
  end

  # GET /availability_types/1
  # GET /availability_types/1.json
  def show
  end

  # GET /availability_types/new
  def new
    @availability_type = AvailabilityType.new
  end

  # GET /availability_types/1/edit
  def edit
  end

  # POST /availability_types
  # POST /availability_types.json
  def create
    @availability_type = AvailabilityType.new(availability_type_params)

    respond_to do |format|
      if @availability_type.save
        format.html { redirect_to availability_types_path, notice: 'Availability type was successfully created.' }
        format.json { render :show, status: :created, location: @availability_type }
      else
        format.html { render :new }
        format.json { render json: @availability_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /availability_types/1
  # PATCH/PUT /availability_types/1.json
  def update
    respond_to do |format|
      if @availability_type.update(availability_type_params)
        format.html { redirect_to availability_types_path, notice: 'Availability type was successfully updated.' }
        format.json { render :show, status: :ok, location: @availability_type }
      else
        format.html { render :edit }
        format.json { render json: @availability_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /availability_types/1
  # DELETE /availability_types/1.json
  def destroy
    @availability_type.destroy
    respond_to do |format|
      format.html { redirect_to availability_types_url, notice: 'Availability type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_availability_type
      @availability_type = AvailabilityType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def availability_type_params
      params.require(:availability_type).permit(:name, :icon, :default_color)
    end
end
