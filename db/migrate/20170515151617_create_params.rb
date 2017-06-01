class CreateParams < ActiveRecord::Migration
  def change
    create_table :params do |t|
      t.references  :degree
      t.integer     :courses_per_quarter
      t.integer     :location #enum
      # 1 = :inclass
      # 2 = :online
      # 3 = :both
    end
  end
end
