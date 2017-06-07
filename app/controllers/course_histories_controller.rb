class CourseHistoriesController < ApplicationController
  def index
    @courses = TakenCourse.where(student: current_student)
  end
  
  def new
  end
  
  def show
  end
end