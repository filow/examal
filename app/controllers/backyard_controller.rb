class BackyardController < ApplicationController
	before_filter :authorize

	def logged_teacher
		Teacher.find_by_id(session[:teacher_id])
	end
	protected
	def authorize
		unless !(session[:teacher_id].nil?) && Teacher.find_by_id(session[:teacher_id])
			redirect_to login_url,alert:"请登录后再使用后台系统"
		end
	end
end