class StateProvsController < ApplicationController
  before_action :set_state_prov, only: [:show, :edit, :update, :destroy]

  # GET /state_provs
  # GET /state_provs.json
  def index
    @state_provs = StateProv.all
  end

  # GET /state_provs/1
  # GET /state_provs/1.json
  def show
  end

  # GET /state_provs/new
  def new
    @state_prov = StateProv.new
  end

  # GET /state_provs/1/edit
  def edit
  end

  # POST /state_provs
  # POST /state_provs.json
  def create
    @state_prov = StateProv.new(state_prov_params)

    respond_to do |format|
      if @state_prov.save
        format.html { redirect_to @state_prov, notice: 'State prov was successfully created.' }
        format.json { render :show, status: :created, location: @state_prov }
      else
        format.html { render :new }
        format.json { render json: @state_prov.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /state_provs/1
  # PATCH/PUT /state_provs/1.json
  def update
    respond_to do |format|
      if @state_prov.update(state_prov_params)
        format.html { redirect_to @state_prov, notice: 'State prov was successfully updated.' }
        format.json { render :show, status: :ok, location: @state_prov }
      else
        format.html { render :edit }
        format.json { render json: @state_prov.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_provs/1
  # DELETE /state_provs/1.json
  def destroy
    @state_prov.destroy
    respond_to do |format|
      format.html { redirect_to state_provs_url, notice: 'State prov was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_prov
      @state_prov = StateProv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_prov_params
      params.require(:state_prov).permit(:name)
    end
end
