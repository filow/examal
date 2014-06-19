module PanelHelper
	def mark_tag(number)
		if number.in?(0..59)
			content_tag :span,number.to_s+"%-不及格",:class=>"label label-important"
		elsif number.in?(60..79)
			content_tag :span,number.to_s+"%-还行",:class=>"label label-warning"
		elsif number.in?(80..89)
			content_tag :span,number.to_s+"%-不错",:class=>"label label-info"
		elsif number.in?(90..100)
			content_tag :span,number.to_s+"%-很好",:class=>"label label-success"
		else
			content_tag :span,number.to_s,:class=>"label label-default"
		end
	end
end
