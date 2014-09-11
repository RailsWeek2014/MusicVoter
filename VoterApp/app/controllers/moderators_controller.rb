class ModeratorsController < ApplicationController

  def playlist_moderators
    @playlist = Playlist.find(params[:playlist_id])
    @moderators = Moderator.where(playlist_id: @playlist.id)
  end

  # POST /moderators
  # POST /moderators.json
  def create
    @user = User.find_by_email(params[:email])
    @playlist = Playlist.find_by_code(params[:code])

    if @user.nil? || @playlist.nil?
      redirect_to :back, :flash => { :alert => "Moderator was not successfully created"}
    else
      @moderator = Moderator.new(playlist_id: @playlist.id, user_id: @user.id)

      if @moderator.save
        redirect_to :back, :flash => { :notice => "Moderator was successfully created"}
      else
        redirect_to :back, :flash => { :alert => "Moderator was not successfully created"}

      end
    end


  end

  # DELETE /moderators/1
  # DELETE /moderators/1.json
  def destroy
    @moderator = Moderator.find(params[:id])
    @moderator.destroy
    redirect_to :back, :flash => { :notice => "Moderator was successfully deleted"}
  end


end
