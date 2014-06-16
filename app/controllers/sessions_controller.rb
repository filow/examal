class SessionsController < ApplicationController
	layout nothing: true
	def new
		@fail_times=session[:fail_times]
		unless session[:fail_wait].nil? 
			if session[:fail_wait]>Time.now.to_i
				@fail_wait=session[:fail_wait]
			else
				session[:fail_wait]=nil
			end
		end

	end

	def create
		if teacher = Teacher.auth(params[:name],params[:password])
			session[:teacher_id]=teacher.id
			session[:teacher_name]=teacher.name
			redirect_to admin_url
		else
			redirect_to login_url,:alert => "不正确的用户名/密码"
		end
	end

	def destroy
		session[:teacher_id]=nil
		redirect_to login_url,notice: "已退出登录"
	end
end
