require 'test_helper'

class MenuControllerTest < ActionController::TestCase
  test "should get menu_user" do
    get :menu_user
    assert_response :success
  end

  test "should get menu_admin" do
    get :menu_admin
    assert_response :success
  end

end
