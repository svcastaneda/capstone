class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string  :major, null: false
      t.string  :concentration, null: false
      t.integer :graduation_year, null: false
      t.string  :phone_number, null: false
      t.string  :bachelors_origin, null: false
      t.integer :advisor_id, null: false
      t.integer :last_path
      
      t.timestamps null: false
    end
  end
end
