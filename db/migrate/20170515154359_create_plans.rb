class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.references  :params
      t.references  :student
      t.references  :course
      
      t.timestamps null: false
    end
  end
end
