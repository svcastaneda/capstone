class DropAdminsAndFaculty < ActiveRecord::Migration
  def change
    drop_table :admins
    drop_table :faculties
  end
end
