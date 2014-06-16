require 'test_helper'

class AdminControllerTest < ActionController::TestCase
	setup do 
		login if defined? session
	end
  test "未登录用户访问" do
  	logout
    get :index
    assert_redirected_to login_url
  end
  test "已登录用户访问" do
    get :index
    assert_response :success
  end

end
