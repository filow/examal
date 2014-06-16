require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    # 用于测试的数据
    @input_attributes = {
      name: "Teacher",
      password: "123456",
      password_confirmation: "123456"
    }
    # 从fixture/teachers.yml中获得一个对象
    @teacher = teachers(:one)
  end

  test "访问教师管理首页" do
    # 访问index方法
    get :index
    # 应当是返回一个成功的代码值
    assert_response :success

    assert_not_nil assigns(:teachers)
  end

  test "访问新建教师账户页面" do
    get :new
    assert_response :success
  end

  test "应当创建一个新的教师账户" do
    assert_difference('Teacher.count') do
      post :create, teacher: @input_attributes
    end

    assert_redirected_to teachers_path
  end

  test "应当看到用户详情" do
    get :show, id: @teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher
    assert_response :success
  end

  test "should update teacher" do
    patch :update, id: @teacher, teacher: @input_attributes
    assert_redirected_to teachers_path
  end

  test "should destroy teacher" do
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end

    assert_redirected_to teachers_path
  end
end
