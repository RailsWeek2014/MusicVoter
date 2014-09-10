class PlayersController < ApplicationController

  def play
      @player = Player.where(playlist_id: params[:playlist_id])[0]
      @mostvoted = @player.playlist.tracks.order(votes: :desc, title: :asc)[0]
  end

  def next_track
    @mostvoted = @player.playlist.tracks.order(votes: :desc, title: :asc)[0].votes = 0
    @mostvoted = @player.playlist.tracks.order(votes: :desc, title: :asc)[0].votes
  end

end
