class TracksController < ApplicationController

  def suggest
    @track = Track.new(title: params[:title], youtube_id: params[:youtube_id], playlist_id: params[:playlist_id])
    if @track.save
      redirect_to list_tracks_path(@track.playlist)
    else
      redirect_to :back
    end
  end

  def accept
    @track = Track.find(params[:id])
    @track.accept = true
    if @track.save
      redirect_to list_tracks_path(@track.playlist)
    else
      redirect_to :back
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @playlist = @track.playlist
    @track.destroy
    redirect_to list_tracks_path(@playlist)
  end

end
