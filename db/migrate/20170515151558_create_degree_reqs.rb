class CreateDegreeReqs < ActiveRecord::Migration
  def change
    rename_table  :course_lists, :courses
    
    create_table :degree_reqs do |t|
      t.references  :degree
      t.references  :course
      t.integer     :class_type #enum
      # 1 = intro
      # 2 = foundation
      # 3 = open
      # 4 = major
      # 5 = advanced
      # 6 = capstone
    end
  end
end
