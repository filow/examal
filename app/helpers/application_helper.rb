module ApplicationHelper
	def admin_only(&block)
		if @logged_teacher.is_admin?
			capture(&block)
		end
	end
	def plugin_css(route,options={})
		options.merge!({rel: "stylesheet",type:"text/css",href: "/plugins/"+route})
		tag "link",options
	end
	def plugin_js(route,options={})
		#<script type="text/javascript" src="plugins/datatables/bootstrap.plugin.js"></script>
		options.merge!({type:"text/javascript",src: "/plugins/"+route})
		content_tag :script,nil,options
	end
end
