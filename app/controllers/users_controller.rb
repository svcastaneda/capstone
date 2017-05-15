class UsersController < ApplicationController
  def login
  end
  
  def new
    if current_user
      redirect_to root_path
    else
      @user = User.new
    end
  end
  
  def create
    @user = User.new(user_params)
    account = user_params[:account_type] == "Student" ? Student.new(student_params) : Faculty.new
    if @user.save && account.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render template: 'users/new'
    end
  end
  
  def edit
    current_user ? (@user = current_user) : (redirect_to login_path)
    # render template: 'users/edit'
  end
  
  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to settings_path
    else
      @errors = @user.errors.full_messages
      render template: 'users/edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:fname, :lname, :id, :email, :username, :password, :password_confirmation)
  end
  
  def student_params
    # params.require(:student).
  end
end