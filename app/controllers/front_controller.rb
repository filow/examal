class FrontController < ApplicationController
	before_filter :authorize
	before_action :set_logged_student
	layout "panel"
	def logged_student
		Student.find_by_id(session[:student_id])
	end
	protected
	def authorize
		unless !(session[:student_id].nil?) && Student.find_by_id(session[:student_id])
			respond_to do |format|
				format.html {redirect_to index_url,alert:"请登录后再使用本系统"}
				format.json {render json: {code: 403,message:"请登录后再使用本系统",message_en:"You Are Not authorized to access before log in"}, status: :forbidden}
			end
			return 
		end
	end
	def set_logged_student
      @logged_student=logged_student
    end
end