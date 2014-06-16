require 'test_helper'

class TeachersControllerTest < ActionController::TestCase
  setup do
    # 用于测试的数据
    @input_attributes = {
      name: "Teacher",
      password: "123456",
      password_confirmation: "123456"
    }
    login_as :one if defined? session
    # 从fixture/teachers.yml中获得一个对象
    @teacher = teachers(:one)
  end
  test "访问教师管理首页" do
    # 访问index方法
    get :index
    # 应当是返回一个成功的代码值
    assert_response :success
    assert_not_nil assigns(:teachers)

    # 使用普通教师帐号访问
    login_as :normal
    # 访问index方法
    get :index
    # 应当是返回一个成功的代码值
    assert_redirected_to edit_teacher_path(teachers(:normal))
  end
  test "访问新建教师账户页面" do
    get :new
    assert_response :success

    # 使用普通教师帐号访问
    login_as :normal

    get :new
    assert_redirected_to edit_teacher_path(teachers(:normal))
    assert_equal flash[:notice],"抱歉，您没有新建教师账户的权限"
  end
  test "创建新的教师账户" do
    assert_difference('Teacher.count') do
      post :create, teacher: @input_attributes
    end

    assert_redirected_to teachers_url

  # 普通教师不可以新建账户
    login_as :normal

    post :create, teacher: @input_attributes
    assert_redirected_to edit_teacher_path(teachers(:normal))
  end

  test "访问用户详情页面" do
    # 管理员用户详情页面应当跳转到教师列表页面
    get :show, id: @teacher
    assert_redirected_to teachers_url

    # 使用普通教师帐号访问
    # 普通教师详情页面应当跳转到信息修改页面
    login_as :normal
    get :show, id: @teacher
    assert_redirected_to edit_teacher_path(teachers(:normal))
  end

  test "访问教师信息编辑页面" do
    get :edit, id: @teacher
    assert_response :success

    login_as :normal
    # 访问其他教师的信息编辑页面
    get :edit, id: @teacher
    assert_redirected_to edit_teacher_path(teachers(:normal))


    # 访问自己的信息编辑页面
    get :edit, id: teachers(:normal)
    assert_response :success
  end


  test "提交账户修改操作" do
    patch :update, id: @teacher, teacher: @input_attributes
    assert_redirected_to teachers_path

    # 普通教师
    login_as :normal
    patch :update, id: @teacher, teacher: @input_attributes

    assert_redirected_to edit_teacher_path(teachers(:normal))

  end

  test "在修改账户时更改is_admin选项" do
    login_as :normal
    normal=teachers(:normal)
    attrs=@input_attributes
    attrs[:is_admin]=true
    patch :update, id: normal, teacher: attrs
    new_normal=Teacher.find_by_id(normal.id)
    assert_equal new_normal.is_admin,normal.is_admin

    login_as :one
    patch :update, id: normal, teacher: attrs
    new_normal=Teacher.find_by_id(normal.id)
    assert_equal new_normal.is_admin? ,true
  end

  test "提交账户删除操作" do

    login_as :normal
    delete :destroy, id: @teacher
    assert_redirected_to edit_teacher_path(teachers(:normal))

    login_as :one
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end
    assert_redirected_to teachers_path

  end


end
