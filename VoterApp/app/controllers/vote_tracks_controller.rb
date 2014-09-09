class VoteTracksController < ApplicationController
  before_action :set_vote_track, only: [:show, :edit, :update, :destroy]

  # GET /vote_tracks
  # GET /vote_tracks.json
  def index
    @vote_tracks = VoteTrack.all
  end

  # GET /vote_tracks/1
  # GET /vote_tracks/1.json
  def show
  end

  # GET /vote_tracks/new
  def new
    @vote_track = VoteTrack.new
  end

  # GET /vote_tracks/1/edit
  def edit
  end

  # POST /vote_tracks
  # POST /vote_tracks.json
  def create
    VoteTrack.transaction do

      @vote_track = VoteTrack.new(user_id: params[:user_id], track_id: params[:track_id])

      if @vote_track.save
        track = @vote_track.track
        track.votes += 1
        track.save!
        flash[:notice] = "You vote was successful"
        redirect_to list_tracks_path(@vote_track.track.playlist)
      else
        format.html { render :new }

      end

    end
  end


  # PATCH/PUT /vote_tracks/1
  # PATCH/PUT /vote_tracks/1.json
  def update
    respond_to do |format|
      if @vote_track.update(vote_track_params)
        format.html { redirect_to @vote_track, notice: 'Vote track was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote_track }
      else
        format.html { render :edit }
        format.json { render json: @vote_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_tracks/1
  # DELETE /vote_tracks/1.json
  def destroy
    @vote_track.destroy
    respond_to do |format|
      format.html { redirect_to vote_tracks_url, notice: 'Vote track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_track
      @vote_track = VoteTrack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_track_params
      params.require(:vote_track).permit(:user_id, :track_id)
    end
end
