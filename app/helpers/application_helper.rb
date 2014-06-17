module ApplicationHelper
	def admin_only(&block)
		if @logged_teacher.is_admin?
			capture(&block)
		end
	end
end
