class ReportsController < ApplicationController
  def index
  end
  
  def new
    @student = params[:id] ? Student.find(params[:id]) : current_user.student
    @report = Report.new
    @params = Param.new
  end
  
  def show
  end
end