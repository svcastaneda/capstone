class ReportsController < ApplicationController
  def index
  end
  
  def new
    @report = Report.new
    @params = Param.new
  end
  
  def show
  end
end