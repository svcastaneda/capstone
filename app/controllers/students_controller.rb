class StudentsController < UsersController
  def index
    if current_user && !current_user.student?
      @users = User.where(account_type: 'Student')
      render template: 'users/index'
    else
      redirect_to root_path
    end
  end
  
  # def show
  #   if current_user && !current_user.student?
  #     @user = Student.find_by_id(params[:student_id]).user
  #   end
  # end
  
  def show
    if current_user && !current_user.student?
      @user = User.find_by_id(params[:id])
    end
  end
  
  def edit
    redirect_to login_path if !current_user
    @user = params[:id] ? User.find(params[:id]) : current_user
    @student = Student.find_by_id(@user.id)
  end
  
  def update
    @user = params[:id] ? User.find(params[:id]) : current_user
    @student = Student.find_by_id(@user.id)
    if @student && @student.update_attributes(student_params) && @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to edit_student_path(@user)
    else
      @errors = @user.errors.full_messages
      render template: 'users/edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:fname, :lname, :id, :email, :username, :password, :password_confirmation, :account_type)
  end
  
  def student_params
    params.require(:student).permit(:degree_id, :advisor_id)
  end
end