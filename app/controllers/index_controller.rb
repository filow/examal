class IndexController < ApplicationController
  def index
  	unless session[:student_id].nil?
		redirect_to panel_index_url
	end
  	@username=""
  	@student = Student.new()

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

  def create
  	@student = Student.new(reg_param)
  	respond_to do |format|
      if @student.save
        format.html { redirect_to index_url, notice: "已成功创建学生账户：#{@student.name}. "}
      else
        format.html { render :create }
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
  def reg_param
  	params.permit(:stuid, :name, :password, :sex, :profession, :grade)
  end
end
