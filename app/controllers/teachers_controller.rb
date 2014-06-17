class TeachersController < BackyardController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  # GET /teachers
  # GET /teachers.json
  def index
    if @logged_teacher.is_admin?
      @teachers = Teacher.all
    else
      redirect_to edit_teacher_url(@logged_teacher)
    end
  end

  # GET /teachers/1
  def show
    if @logged_teacher.is_admin?
      redirect_to teachers_url
    else
      redirect_to edit_teacher_path(@logged_teacher)
    end
  end

  # GET /teachers/new
  def new
    if @logged_teacher.is_admin?
      @teacher = Teacher.new
    else
      redirect_to edit_teacher_path(@logged_teacher),notice: "抱歉，您没有新建教师账户的权限"
    end
  end

  # GET /teachers/1/edit
  def edit
    unless @logged_teacher.id==params[:id].to_i
      unless @logged_teacher.is_admin?
        redirect_to edit_teacher_path(@logged_teacher),notice:"您只能编辑你自己的信息"
      end
    end
  end

  # POST /teachers
  # POST /teachers.json
  def create
    unless @logged_teacher.is_admin?
      redirect_to edit_teacher_path(@logged_teacher),notice:"抱歉，您没有新建教师账户的权限"
    else
      @teacher = Teacher.new(teacher_params)

      respond_to do |format|
        if @teacher.save
          format.html { redirect_to teachers_url, notice: "已成功创建教师账户：#{@teacher.name}." }
        else
          format.html { render :new }
        end
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    unless @logged_teacher.id==params[:id].to_i
      unless @logged_teacher.is_admin?
        redirect_to edit_teacher_path(@logged_teacher),notice:"您只能编辑你自己的信息"
        return
      end
    end
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teachers_url, notice: '成功修改教师账户信息.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    unless @logged_teacher.is_admin?
      redirect_to edit_teacher_path(@logged_teacher),notice:"抱歉，您没有删除教师账户的权限"
      return
    end

    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: '已删除教师账户.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      if @logged_teacher.is_admin?
        params.require(:teacher).permit(:name, :password,:password_confirmation, :is_admin)
      else
        params.require(:teacher).permit(:name, :password,:password_confirmation)
      end
    end
end
