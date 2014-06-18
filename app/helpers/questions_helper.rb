module QuestionsHelper
	def diffculty(number)
		case number
		when 1..2
			content_tag :span,number.to_s+"-入门",:class=>"label"
		when 3..4
			content_tag :span,number.to_s+"-简单",:class=>"label label-success"
		when 5..6
			content_tag :span,number.to_s+"-普通",:class=>"label label-info"
		when 7..8
			content_tag :span,number.to_s+"-稍难",:class=>"label label-warning"
		when 9..10
			content_tag :span,number.to_s+"-困难",:class=>"label label-important"
		else
			content_tag :span,number.to_s,:class=>"label"
		end
	end

end
