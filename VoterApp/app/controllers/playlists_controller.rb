class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update, :destroy]
  caches_page :waitlist, :tracklist, :top5

  #meine methoden
  def list_tracks
    if params[:code]
      @playlist = Playlist.find_by_code(params[:code])
    else
      @playlist = Playlist.find( params[:id])
    end
    if @playlist.nil?
      redirect_to :back, :flash => { :alert => "No Playlist with this Code" }
    end
    j = JoinedUser.new(playlist_id: @playlist.id, user_id: current_user.id)
    j.save
  end

  def waitlist
    @playlist = Playlist.find(params[:id])
    @tracks = @tracks = @playlist.tracks.order(title: :asc).where(accept: false)
    render layout: false
  end

  def tracklist
    @playlist = Playlist.find(params[:id])
    @tracks = @playlist.tracks.order(title: :asc).where(accept: true)
    render layout: false
  end
  def top5
    @playlist = Playlist.find(params[:id])
    @tracks = @playlist.tracks.order(votes: :desc).where(accept: true)[0..4]
    render layout: false
  end
  # GET /playlists<<<<
  # GET /playlists.json
  def index
    @playlists = current_user.playlists.all
  end

  # GET /playlists/1
  # GET /playlists/1.json
  def show
  end

  # GET /playlists/new
  def new
    @playlist = Playlist.new
  end

  # GET /playlists/1/edit
  def edit
  end

  # POST /playlists
  # POST /playlists.json
  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user = current_user
    respond_to do |format|
      if @playlist.save
        current_user.playlists << @playlist
        format.html { redirect_to @playlist, notice: 'Playlist was successfully created.' }
        format.json { render :show, status: :created, location: @playlist }
      else
        format.html { render :new }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlists/1
  # PATCH/PUT /playlists/1.json
  def update
    respond_to do |format|
      if @playlist.update(playlist_params)
        format.html { redirect_to @playlist, notice: 'Playlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @playlist }
      else
        format.html { render :edit }
        format.json { render json: @playlist.errors, status: :unprocessable_entity }
      end
    end
  end
  


  # DELETE /playlists/1
  # DELETE /playlists/1.json
  def destroy
    @playlist.destroy
    respond_to do |format|
      format.html { redirect_to playlists_url, notice: 'Playlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  public
  def get_mostvoted_track id
    @playlist = Playlist.find(id)
    @playlist.tracks.order(votes: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def playlist_params
      params.require(:playlist).permit(:title, :code, :description)
    end
end
