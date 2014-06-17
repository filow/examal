module StudentsHelper
	def sex_text(sex)
		if sex==true
			"男"
		elsif sex==false
			"女"
		else
			""
		end
	end
end
