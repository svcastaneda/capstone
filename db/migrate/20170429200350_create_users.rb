class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :account_id, null: false
      t.string  :account_type, null: false
      t.string  :username, null: false, limit: 30
      t.string  :email, null: false, limit: 30
      t.string  :password_digest, null: false
      t.string  :fname, null: false
      t.string  :lname, null: false
      
      t.timestamps null: false
    end
    # :account_type can be admin, student, or faculty
  end
end
