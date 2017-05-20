class UpdateStudent < ActiveRecord::Migration
  def change
    remove_columns :students, :major, :concentration, :graduation_year, :phone_number, :bachelors_origin, :last_path
    remove_column :users, :account_id
    add_reference :students, :degree, foreign_key: true
  end
end
