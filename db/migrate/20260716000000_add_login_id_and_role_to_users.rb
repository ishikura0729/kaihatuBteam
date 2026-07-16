class AddLoginIdAndRoleToUsers < ActiveRecord::Migration[7.1]
  def up
    add_column :users, :login_id, :string unless column_exists?(:users, :login_id)
    add_column :users, :role, :integer, default: 2 unless column_exists?(:users, :role)
  end

  def down
    remove_column :users, :login_id if column_exists?(:users, :login_id)
    remove_column :users, :role if column_exists?(:users, :role)
  end
end
