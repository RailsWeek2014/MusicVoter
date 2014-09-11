class PlayersController < ApplicationController

  def play
    @player = Player.where(playlist_id: params[:playlist_id])[0]
    if @player.dj_id != current_user.id
      s = "DJ is already " + User.find(@player.dj_id).email
      redirect_to :back, :flash => { :alert => s}
    end
    @mostvoted = @player.playlist.tracks.where(accept: true).order(votes: :desc, title: :asc)[0]
  end
  def set_dj
    @player = Player.where(playlist_id: params[:playlist_id])[0]
    @player.dj_id = params[:dj_id]
    @player.save
    s = "DJ is now " + User.find(@player.dj_id).email
    redirect_to :back, :flash => { :notice => s}
  end
  def next_track
    @mostvoted = @player.playlist.tracks.order(votes: :desc, title: :asc)[0].votes = 0
    @mostvoted = @player.playlist.tracks.order(votes: :desc, title: :asc)[0].votes
  end

  def choice
    @playlist = Playlist.find(params[:playlist_id])
    @player = Player.where(playlist_id: @playlist.id)[0]
  end

  def set_votes
    @p = params[:choise]
    @p1 = params[:player_id]
    @p2 = params
    @player = Player.find(params[:player_id])
    if params[:choise] == "to_null"
      @player.set_votes_to_null=true
      @player.save
      redirect_to playlists_path, :flash => { :notice => "Votes set now to null after playing"}
    else
      @player.set_votes_to_null=false
      @player.save
      redirect_to playlists_path, :flash => { :notice => "Track delete now after playing"}
    end
  end
end
