class QuestionsController < BackyardController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :edit_or_delete_right
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.order(updated_at: :desc).all
  end

  # GET /questions/1
  # GET /questions/1.json
  # GET /questions/1.js
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /questions/1/edit
  def edit
    unless @edit_or_delete_right
      redirect_to questions_url,notice:"您没有修改别人编写的题目的权限"
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to new_question_url, notice: "已经成功创建题目：#{@question.title}." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    unless @edit_or_delete_right
      redirect_to questions_url,notice:"您没有修改别人编写的题目的权限"
    end
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to questions_url, notice: "已经成功更新题目：#{@question.title}." }
        format.json { render :show, status: :ok, location: questions_url }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    unless @edit_or_delete_right
      redirect_to questions_url,notice:"您没有删除别人编写的题目的权限"
    end
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: '已成功删除题目.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      prm=params.require(:question).permit(:title, :description, :options,  :difficulty,answer: [])
      prm[:teacher_id]=@logged_teacher.id
      answer=""
      count=0
      prm[:answer].each{ |x|
        unless x.empty?
          answer+=x.to_s+","
          count+=1
        end
      }
      prm[:answer]=answer
      prm[:multiple]=true if count>0
      
      return prm
    end
    def edit_or_delete_right
        @edit_or_delete_right=@logged_teacher.is_admin? || @logged_teacher.id==question.teacher.id
    end
end
