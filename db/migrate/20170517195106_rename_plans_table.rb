class RenamePlansTable < ActiveRecord::Migration
  def change
    rename_table :plans, :reports
  end
end
