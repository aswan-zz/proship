class MessagesController < AuthenticationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.includes(:member_to).includes(:member_from).all
  end

  def messages_to
    @messages = Message.includes(:member_from).
              where(:member_to_id => params[:id]).
              order(updated_at: :DESC, read: :DESC)
    @grouped_types = @messages.group_by {|el| el["read"]} unless @messages == nil
    render 'thread'
  end

  def messages_from
    @messages = Message.includes(:member_to).
              where(:member_from_id => params[:id]).
              order(updated_at: :DESC, read: :DESC)
    @grouped_types = @messages.group_by {|el| el["read"]} unless @messages == nil
    render 'thread'
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/new
  def new_reply
    msg = Message.find(params[:id])
    puts "Parent: " + msg.id.to_s
    puts "member_to: " + msg.member_to_id.to_s
    puts "member_from: " + msg.member_from_id.to_s
    
    @message = Message.new
    @message.parent = msg
    @message.member_to = msg.member_from
    @message.member_from = msg.member_to
    render 'new', layout: false
  end
  
  def create_reply
    @message = Message.create_from_hash(message_params)

    respond_to do |format|
      if @message.save
        format.html { render 'message', layout: false, notice: 'Message was successfully created.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render json: @message.errors, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end    
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.create_from_hash(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_url, notice: 'Message was successfully created.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to messages_url, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:member_to_name, :member_to_id, 
                                      :member_from_id, :content, :parent)
    end
end
