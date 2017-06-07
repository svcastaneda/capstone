require 'will_paginate/array'
class CoursesController < ApplicationController
  def index
    @courses = Course.all.paginate(:page => params[:page], :per_page => 25)
  end
  
  def show
    @course = Course.find_by(num: params[:id])
  end
  
  def new
  end
  
  def create
  end
  
  def edit
    if current_user
      if current_user.admin?
        @course = Course.find(params[:id])
        redirect_to root_path if @course.nil?
      elsif current_user.faculty?
        redirect_to courses_path
      else
        redirect_to root_path
      end
    else
      redirect_to login_path  
    end
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  def course_params
    params.require(:course).permit()
  end
end