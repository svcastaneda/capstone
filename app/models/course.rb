class Course < ActiveRecord::Base
  validates :num, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  
  def course_days
    CourseDay.find(dates)
  end
  
  def course_times
    CourseTime.find(times)
  end
  
  def dates_times_hash
    Hash[*course_times.zip(course_days).flatten]
  end
end
