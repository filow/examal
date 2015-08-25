class SessionsController < ApplicationController
	layout nothing: true
	# get /login
	def new
		if session[:teacher_id]
			redirect_to admin_url
		end
	end

	# post /login
	def create
		if teacher = Teacher.auth(params[:name],params[:password])
			session[:teacher_id]=teacher.id
			session[:teacher_name]=teacher.name
			redirect_to admin_url
		else
			redirect_to login_url,:alert => "不正确的用户名/密码"
		end
	end

	# delete /logout
	def destroy
		session[:teacher_id]=nil
		redirect_to login_url,notice: "已退出登录"
	end
end
