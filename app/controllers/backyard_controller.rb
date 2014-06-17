class BackyardController < ApplicationController
	before_filter :authorize
	before_action :set_logged_teacher
	def logged_teacher
		Teacher.find_by_id(session[:teacher_id])
	end
	protected
	def authorize
		unless !(session[:teacher_id].nil?) && Teacher.find_by_id(session[:teacher_id])
			redirect_to login_url,alert:"请登录后再使用后台系统"
		end
	end
	def set_logged_teacher
      @logged_teacher=logged_teacher
    end
end