class ChangeCourseTimeTimeTypeColumn < ActiveRecord::Migration
  def change
    change_column :course_times, :time_type, :string, limit: 25, null: false
  end
end
