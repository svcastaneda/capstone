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