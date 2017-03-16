class MembersController < AuthenticationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  skip_before_action :current_user, only: [:home, :login, :logout, :register]
  
  # GET /members
  # GET /members.json
  def index
    @back_link = admin_path
    @members = Member.all
  end

  def home
    @member = Member.new
    render :layout => false
  end
  
  def admin
    @back_link = url_for :controller=>'members', :action=>'show', :id=> @current_user.id
    render 'admin_actions'
  end
  
  def logout
    @current_member = nil
    session[:member_id] = nil
    redirect_to "/"
  end

  def login
    @current_member = Member.where("email = ? AND fakepass = ?", 
              params[:member][:email].downcase, 
              params[:member][:password]).first

    if @current_member
      session[:member_id] = @current_member.id
    else
      msg = {}
      msg["We can't find that. "] = "Either the email address or password are incorrect."
    end
    
    respond_to do |format|
      if @current_member
        format.html { redirect_to edit_member_path(id), notice: 'Welcome' }
        format.json { render json: {:status => :created, 
                                    :url => edit_member_path(@current_member.id)} }
      else
        format.html { render "/" }
        format.json { render json: msg, status: :unprocessable_entity }
      end
    end
  end
  
  def register
    @member = Member.new(member_params)
    @member.fakepass = @member.password
    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: {:status => :created, :url => edit_member_path(@member.id)} }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # GET /members/1
  # GET /members/1.json
  def show
    respond_to do |format|
      format.html {}
      format.json {}
      format.xml {render xml: @member.to_xml()}
    end
    @back_link = members_path
  end

  def new_note
    render action: "notes/new" 
  end

  # GET /members/new
  def new
    @member = Member.new
    @back_link = members_path
  end

  # GET /members/1/edit
  def edit
    @back_link = members_path
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    mp = member_params
    respond_to do |format|
      if @member.update(mp)
        puts "\n\nUpdate succeeded\n\n"
        puts mp
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        puts "\n\nUpdate failed\n\n"
        puts mp
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end
    
    def get_state_prov
      if params[:member][:state_prov_id] == nil
        return
      end
      r = StateProv.where(name: params[:member][:state_prov_id]).take
      if r != nil then
        r.id
      end
    end
    
    def get_country(country_name)
      if params[:member][:state_prov_id] == nil
        return
      end
      r = Country.where(name: country_name).take
      if r != nil then
        r.id
      end
    end

    def get_airport
      if params[:member][:home_airport] == nil
        return
      end
      Airport.where(params[:member][:home_airport]).take.id
    end
    
    def get_state_prov_name(state_prov_id)
      if params[:member][:state_prov_id] == nil
        return
      end
      r = StateProv.find(state_prov_id) unless state_prov_id == nil
      r.name unless r == nil
    end
    
    def get_country_name(country_id)
      if country_id == nil
        return
      end
      r = Country.find(country_id) unless country_id == nil
      if r != nil then
        r.name
      end
    end

    def get_airport_name
      if params[:member][:home_airport] == nil
        return
      end
      Airport.where(params[:member][:home_airport]).take.name
    end
    
    def just_integer(data)
      if data == nil
        return
      end
      data.gsub(/\D/, '')
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params[:member][:state_prov_id] = get_state_prov
      params[:member][:country_id] = get_country(params[:member][:country_id])
      params[:member][:residency_id] = get_country(params[:member][:residency_id])
      params[:member][:citizenship_id] = get_country(params[:member][:citizenship_id])
      params[:member][:main_mobile] = just_integer(params[:member][:main_mobile])
      params[:member][:main_phone] = just_integer(params[:member][:main_phone])
      params[:member][:email] = (params[:member][:email]).downcase

      params.require(:member).permit(:first_name, :last_name, 
                                    :pronounce, :email, :birthday, 
                                    :address, :city, :state_prov_id, 
                                    :country_id, :zip_post, :home_airport, 
                                    :medical_conditions, :criminal_convictions, 
                                    :residency_id, :citizenship_id, 
                                    :employee_number,
                                    :main_phone, :main_mobile,
                                    :password, :password_confirmation)
                                    
    end
end
