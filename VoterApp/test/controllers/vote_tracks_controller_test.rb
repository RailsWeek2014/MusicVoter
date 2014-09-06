require 'test_helper'

class VoteTracksControllerTest < ActionController::TestCase
  setup do
    @vote_track = vote_tracks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_tracks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_track" do
    assert_difference('VoteTrack.count') do
      post :create, vote_track: { track_id: @vote_track.track_id, user_id: @vote_track.user_id }
    end

    assert_redirected_to vote_track_path(assigns(:vote_track))
  end

  test "should show vote_track" do
    get :show, id: @vote_track
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_track
    assert_response :success
  end

  test "should update vote_track" do
    patch :update, id: @vote_track, vote_track: { track_id: @vote_track.track_id, user_id: @vote_track.user_id }
    assert_redirected_to vote_track_path(assigns(:vote_track))
  end

  test "should destroy vote_track" do
    assert_difference('VoteTrack.count', -1) do
      delete :destroy, id: @vote_track
    end

    assert_redirected_to vote_tracks_path
  end
end
