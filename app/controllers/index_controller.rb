class IndexController < ApplicationController
  def index
  	unless session[:student_id].nil?
		redirect_to panel_index_url
	end
  	@username=""

  end

  def new

  	stuinfo=login_param
  	@username=stuinfo[:username]

  	respond_to do |format|
      if student=Student.auth(stuinfo[:username],stuinfo[:password])
      	session[:student_id]=student.id
		session[:student_name]=student.name
        format.html { redirect_to panel_index_url}
      else
        format.html { redirect_to index_url,:notice => "不正确的用户名/密码" }
      end
    end
  end

  def destroy
  	session[:student_id]=nil
	redirect_to index_url
  end

  private

  def login_param
  	params.permit(:username,:password)
  end
end
