class JoinedUsersController < ApplicationController

  def joined
    @joined_users = JoinedUser.where(user_id: current_user.id)
    @playlists = @joined_users.collect{|it| Playlist.find(it.playlist_id)}
  end

  # POST /joined_users
  # POST /joined_users.json
  def create
    @joined_user = JoinedUser.new(joined_user_params)

    respond_to do |format|
      if @joined_user.save
        format.html { redirect_to @joined_user, notice: 'Joined user was successfully created.' }
        format.json { render :show, status: :created, location: @joined_user }
      else
        format.html { render :new }
        format.json { render json: @joined_user.errors, status: :unprocessable_entity }
      end
    end
  end

end