class CreateCourseTimes < ActiveRecord::Migration
  def change
    create_table :course_times do |t|
      t.integer  :time_type
    end
  end
end
