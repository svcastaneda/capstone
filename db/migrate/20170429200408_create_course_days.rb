class CreateCourseDays < ActiveRecord::Migration
  def change
    create_table :course_days do |t|
      t.string  :day_type, null: false, limit: 5
    end
  end
end
