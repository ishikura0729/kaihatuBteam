class AddLoginIdAndRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :login_id, :string
    add_column :users, :role, :integer
  end
end
