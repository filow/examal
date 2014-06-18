module ExamsHelper
	def time2str(time)
		unless time.nil?
			time.strftime("%m月%d日 %H:%M")
		end
	end
end
