class CreateTakenCourses < ActiveRecord::Migration
  def change
    create_table :taken_courses do |t|
      t.references  :student
      t.references  :course
    end
  end
end
