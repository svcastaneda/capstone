class AddNameColumnToCoursesTable < ActiveRecord::Migration
  def change
    add_column :courses, :name, :string, null: false
    add_column :courses, :subject, :string, null: false
    add_column :courses, :number, :integer, null: false
  end
end
