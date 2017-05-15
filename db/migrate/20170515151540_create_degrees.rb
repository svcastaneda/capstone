class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string  :name, null: false
      t.integer :num_intro, null: false, default: 0
      t.integer :num_foundation, null: false, default: 0
      t.integer :num_advanced, null: false, default: 0
      t.integer :num_major_electives, null: false, default: 0
      t.integer :num_open_electives, null: false, default: 0
    end
  end
end
