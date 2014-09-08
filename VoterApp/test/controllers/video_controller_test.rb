require 'test_helper'

class VideoControllerTest < ActionController::TestCase
  test "should get client" do
    get :client
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get details" do
    get :details
    assert_response :success
  end

end
