class PanelController < FrontController
  def index
  end

  def taken
  end

  def untaken
  	now=Time.now
  	@current=Exam.where("valid_from <= ? and valid_to >= ?",now,now)
  	@not_ready=Exam.where("valid_from > ?",now)
  	@old=Exam.where("valid_to < ?",now)

  end

  def info
  	@student=@logged_student
  end

  def exam

  	student=@logged_student
  	if student.exams.find_by_id(params[:id])
  		redirect_to panel_untaken_url,notice:"您已经参加过这门考试"
  	end
  	begin
  		@exam=Exam.find(params[:id])
  	rescue Exception => e
  		redirect_to panel_untaken_url,notice:"没有找到这门考试"
  	end

  end
end
