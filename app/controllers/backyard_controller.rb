class BackyardController < ApplicationController
	before_filter :authorize


	protected
	def authorize
		unless !(session[:teacher].nil?) && Teacher.find_by_id(session[:teacher_id])
			redirect_to login_url,alert:"请登录后再使用后台系统1"
		end
	end
end