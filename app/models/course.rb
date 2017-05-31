class Course < ActiveRecord::Base
  def course_days
    CourseDay.find(dates)
  end
  
  def course_times
    CourseTime.find(times)
  end
end
