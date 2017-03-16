class NotesController < AuthenticationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  layout false

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all.order("updated_at DESC")
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end
  
  def member_notes
    @notes = Note.joins(:note_type).
              where(:member_to_id => params[:id]).
              select('notes.*, note_types.name as note_type_name, 
                      note_types.icon as note_type_icon, 
                      note_types.default_color as note_type_default_color').
              order("updated_at DESC")
    @grouped_types = @notes.group_by {|el| el["note_type_name"]}
    #@red_flags = grouped_types["Red Flag"].length.to_s
    #@positive_notes = grouped_types["Positive Note"].length.to_s
    #@grouped_types.map {|k,v| [k, v.length]
    #  k = k.downcase.gsub(/\s/, '_')
    #  puts "\n\n k = " + k.to_s + " v.length = " + v.length.to_s
    #}
    render 'index'
  end

  # GET /notes/1/edit
  def edit
    respond_to do |format|
      format.html {  }
      format.json { render json: @note }
    end
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to notes_path, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    id = @note.member_to_id
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:content, :note_type_id, :member_from_id, :member_to_id)
    end
end
