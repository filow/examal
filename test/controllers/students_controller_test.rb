require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:stu1)
    login_as :admin if defined? session
    @new_attrs={grade: "12", password: "111", name: "hihi", profession: "", sex: "true", stuid:"125213912"}
  end

  test "访问学生列表页面" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "访问新建学生页面" do
    get :new
    assert_response :success
  end

  test "新建一个学生" do
    assert_difference('Student.count') do
      post :create, student: @new_attrs
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "查看学生信息页面" do
    get :show, id: @student
    assert_response :success
  end

  test "访问编辑学生信息页面" do
    get :edit, id: @student
    assert_response :success
  end

  test "更新学生信息页面" do
    patch :update, id: @student, student: { grade: @student.grade, hashed_password: @student.hashed_password, name: @student.name, profession: @student.profession, sex: @student.sex, stuid: @student.stuid }
    assert_redirected_to student_path(assigns(:student))
  end

  test "删除学生帐号" do
    login_as :normal
    delete :destroy, id: @student
    assert_redirected_to students_path

    login_as :admin
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
