module QuestionsHelper
	def difficulty_level(number)
		if number.in?(1..2)
			content_tag :span,number.to_s+"-入门",:class=>"label"
		elsif number.in?(2..4)
			content_tag :span,number.to_s+"-简单",:class=>"label label-success"
		elsif number.in?(4..6)
			content_tag :span,number.to_s+"-普通",:class=>"label label-info"
		elsif number.in?(6..8)
			content_tag :span,number.to_s+"-稍难",:class=>"label label-warning"
		elsif number.in?(6..10)
			content_tag :span,number.to_s+"-困难",:class=>"label label-important"
		else
			content_tag :span,number.to_s,:class=>"label"
		end
	end

end
