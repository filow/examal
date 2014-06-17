require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "访问登录页面" do
    get :new
    assert_response :success
  end

  test "成功的登录" do
    test=teachers(:admin)
    post :create, :name => test.name,:password => "admin"
    assert_redirected_to admin_url
    assert_equal test.id,session[:teacher_id]
    assert_equal test.name,session[:teacher_name]
  end

  test "失败的登录" do
    test=teachers(:admin)
    post :create, :name => test.name,:password => "11111"
    assert_redirected_to login_url
  end
  test "退出登录" do
    get :destroy
    assert_redirected_to login_url
  end

end
