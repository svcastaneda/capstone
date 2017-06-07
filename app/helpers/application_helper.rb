module ApplicationHelper
  def current_student
    params[:id] ? Student.find(params[:id]) : current_user.student if session[:user_id]
  end
end
