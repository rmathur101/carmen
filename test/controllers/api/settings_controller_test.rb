require 'test_helper'

class Api::SettingsControllerTest < ActionController::TestCase
  test "should get update_password" do
    get :update_password
    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
