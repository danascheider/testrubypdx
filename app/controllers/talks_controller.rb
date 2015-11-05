class TalksController < ApplicationController
  before_action :set_talk, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:new, :create, :edit, :update]

  # GET /talks
  # GET /speakers/:id/talks
  # GET /meetings/:id/talks
  # GET /talks.json
  def index
    @talks = if params[:speaker_id] then Speaker.find(params[:speaker_id].to_i).talks;
    elsif params[:meeting_id] then Meeting.find(params[:meeting_id].to_i).talks;
    else Talk.all;
    end
  end

  # GET /talks/1
  # GET /talks/1.json
  def show
  end

  # GET /talks/new
  def new
    @admin = User.first
    @talk = Talk.new
    @meeting = Meeting.find(params[:meeting_id]) if params[:meeting_id]
    @speaker = Speaker.find(params[:speaker_id]) if params[:speaker_id]

    render :layout => 'admin'
  end

  # GET /talks/1/edit
  def edit
  end

  # POST /talks
  # POST /talks.json
  def create
    @talk = Talk.new(talk_params)
    @talk.meeting_id ||= params[:meeting_id]
    @talk.speaker_id ||= params[:speaker_id]

    respond_to do |format|
      if @talk.save
        format.html { redirect_to @talk, notice: 'Talk was successfully created.' }
        format.json { render :show, status: :created, location: @talk }
      else
        format.html { render :new }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talks/1
  # PATCH/PUT /talks/1.json
  def update
    respond_to do |format|
      if @talk.update(talk_params)
        format.html { redirect_to @talk, notice: 'Talk was successfully updated.' }
        format.json { render :show, status: :ok, location: @talk }
      else
        format.html { render :edit }
        format.json { render json: @talk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.json
  def destroy
    @talk.destroy
    respond_to do |format|
      format.html { redirect_to talks_url, notice: 'Talk was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_talk
      @talk = Talk.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def talk_params
      params.require(:talk).permit(:date, :title, :description, :speaker_id, :meeting_id)
    end
end
