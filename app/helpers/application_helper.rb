module ApplicationHelper
	def admin_only(&block)
		if @logged_teacher.is_admin? || 
			capture(&block)
		end
	end
	def admin_and_self_only(id,&block)
		if @logged_teacher.is_admin? || @logged_teacher.id==id
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
	def time_span(times)
		result=""
		times=times.to_i
		if times > 24*60*60
			result+="#{times/(24*60*60)}天"
			times%=24*60*60
		end
		if times > 60*60
			result+="#{times/(60*60)}小时"
			times%=60*60
		end
		if times > 60
			result+="#{times/60}分"
			times%=60
		end
		result+="#{times}秒"
		result
	end
end
