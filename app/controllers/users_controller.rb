class UsersController < ApplicationController  
  def index
    if current_user.nil?
      redirect_to login_path
    elsif current_user.faculty?
      @users = Student.where(advisor_id: current_user.id).map{|s| s.user}
      render template: 'users/index'
    elsif current_user.admin?
      render template: 'admins/index'
    elsif current_user.student?
      render template: 'reports/index'
    end
  end
  
  def all_users
    if current_user && current_user.admin?
      @users = User.where.not(id: current_user.id).paginate(:page => params[:page], :per_page => 25)
      render template: 'users/index'
    else
      redirect_to root_path
    end
  end
  
  def show
    if current_user && !current_user.student?
      @user = User.find_by_id(params[:id])
    end
  end
  
  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
      @student = Student.new
    end
  end
  
  def create
    @user = User.new(user_params)
    @student = Student.new(student_params)
    account = user_params[:account_type] == "Student" ? @student : @user
    if @user.save && account.save
      @student.update_attributes(id: @user.id) if @user.student?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render template: 'users/new'
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
      redirect_to edit_student_path(@user)#settings_path
    elsif @user && @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      if @user == current_user
        redirect_to settings_path
      else
        redirect_to edit_faculty_path(@user)
      end
    else
      @errors = @user.errors.full_messages
      render template: 'users/edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end
  
  private
  def user_params
    params.require(:user).permit(:fname, :lname, :id, :email, :username, :password, :password_confirmation, :account_type)
  end
  
  def student_params
    params.require(:student).permit(:degree_id, :advisor_id)
  end
end