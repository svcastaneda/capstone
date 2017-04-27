class UsersController < ApplicationController
  def login
  end
  
  def new
  end
  
  def edit
    current_user ? (@user = current_user) : (redirect_to login_path)
    # render template: 'users/edit'
  end
  
  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render template: 'users/edit'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end
end