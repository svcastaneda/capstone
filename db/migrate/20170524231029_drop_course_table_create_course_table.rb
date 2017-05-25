class DropCourseTableCreateCourseTable < ActiveRecord::Migration
  def change
    drop_table :courses
    change_column :course_days, :day_type, :string, limit: 10
    
    create_table :courses do |t|
      t.string  :num, null: false, limit: 10
      t.string  :name, null: false
      t.text    :description, null: false
      t.string  :prerequisites, null: false, array: true, default: '{}'
      t.integer :times, null: false, array: true, default: '{}'
      t.integer :dates, null: false, array: true, default: '{}'
    end
  end
end
