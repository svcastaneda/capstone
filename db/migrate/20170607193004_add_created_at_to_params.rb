class AddCreatedAtToParams < ActiveRecord::Migration
  def change
    add_column(:params, :created_at, :datetime)
  end
end
