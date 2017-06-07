class CourseHistoriesController < ApplicationController
  def index
    @courses = Course.find(TakenCourse.where(student: current_student).map(&:course_id))
  end
  
  def new
  end
  
  def show
  end
end