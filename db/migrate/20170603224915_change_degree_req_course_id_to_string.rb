class ChangeDegreeReqCourseIdToString < ActiveRecord::Migration
  def change
    rename_column :degree_reqs, :course_id, :course_num
    change_column :degree_reqs, :course_num, :string
  end
end
