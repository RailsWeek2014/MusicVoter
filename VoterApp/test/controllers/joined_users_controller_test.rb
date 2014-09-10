require 'test_helper'

class JoinedUsersControllerTest < ActionController::TestCase
  setup do
    @joined_user = joined_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:joined_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create joined_user" do
    assert_difference('JoinedUser.count') do
      post :create, joined_user: { playlist: @joined_user.playlist, user: @joined_user.user }
    end

    assert_redirected_to joined_user_path(assigns(:joined_user))
  end

  test "should show joined_user" do
    get :show, id: @joined_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @joined_user
    assert_response :success
  end

  test "should update joined_user" do
    patch :update, id: @joined_user, joined_user: { playlist: @joined_user.playlist, user: @joined_user.user }
    assert_redirected_to joined_user_path(assigns(:joined_user))
  end

  test "should destroy joined_user" do
    assert_difference('JoinedUser.count', -1) do
      delete :destroy, id: @joined_user
    end

    assert_redirected_to joined_users_path
  end
end
