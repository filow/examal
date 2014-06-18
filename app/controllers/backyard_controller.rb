class BackyardController < ApplicationController
	before_filter :authorize
	before_action :set_logged_teacher
	def logged_teacher
		Teacher.find_by_id(session[:teacher_id])
	end
	protected
	def authorize
		unless !(session[:teacher_id].nil?) && Teacher.find_by_id(session[:teacher_id])
			respond_to do |format|
				format.html {redirect_to login_url,alert:"请登录后再使用后台系统"}
				format.json {render json: {code: 403,message:"请登录后再使用后台系统",message_en:"You Are Not authorized to access these data,please log in first"}, status: :forbidden}
			end
			return 
		end
	end
	def set_logged_teacher
      @logged_teacher=logged_teacher
    end
end