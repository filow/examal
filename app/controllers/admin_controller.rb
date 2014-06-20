class AdminController < BackyardController
  def index
  	@exam_count=Contest.count
  end
end
