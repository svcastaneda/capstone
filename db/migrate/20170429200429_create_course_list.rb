class CreateCourseList < ActiveRecord::Migration
  def change
    create_table :course_lists do |t|
      t.string  :fall_availability, null: false, limit: 10
      t.string  :winter_availability, null: false, limit: 10
      t.string  :spring_availability, null: false, limit: 10
      t.string  :summer_1st_half_availability, null: false, limit: 10
      t.string  :summer_2nd_half_availability, null: false, limit: 10
      t.string  :summer_full_availability, null: false, limit: 10
      t.string  :phase, null: false, limit: 1
      t.string  :prerequisites, null: false, array: true, default: '{}'
      t.text    :description, null: false
      t.integer :peoplesoft, null: false
      t.integer :fall_times, null: false
      t.integer :winter_times, null: false
      t.integer :spring_times, null: false
      t.integer :summer_1st_half_times, null: false
      t.integer :fall_days, null: false
      t.integer :winter_days, null: false
      t.integer :spring_days, null: false
      t.integer :summer_1st_half_days, null: false
      t.integer :summer_2nd_half_times, null: false
      t.integer :summer_full_times, null: false
      t.integer :summer_2nd_half_days, null: false
      t.integer :summer_full_days, null: false
    end
  end
end
