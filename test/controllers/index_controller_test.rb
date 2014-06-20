require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    student=students(:stu1)
    post :new,{username:students.name,password:"111"}
    assert_redirected_to panel_index_url
  end

  test "should get destroy" do
    delete :destroy
    assert_redirected_to index_url
  end

end
