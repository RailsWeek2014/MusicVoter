class VoteTracksController < ApplicationController

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
        redirect_to :back, flash: {alert: "Voting was not successful"}
      end

    end
  end

end
