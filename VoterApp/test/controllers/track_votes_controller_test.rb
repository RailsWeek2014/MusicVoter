require 'test_helper'

class TrackVotesControllerTest < ActionController::TestCase
  setup do
    @track_vote = track_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:track_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create track_vote" do
    assert_difference('TrackVote.count') do
      post :create, track_vote: {  }
    end

    assert_redirected_to track_vote_path(assigns(:track_vote))
  end

  test "should show track_vote" do
    get :show, id: @track_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @track_vote
    assert_response :success
  end

  test "should update track_vote" do
    patch :update, id: @track_vote, track_vote: {  }
    assert_redirected_to track_vote_path(assigns(:track_vote))
  end

  test "should destroy track_vote" do
    assert_difference('TrackVote.count', -1) do
      delete :destroy, id: @track_vote
    end

    assert_redirected_to track_votes_path
  end
end
