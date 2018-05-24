class AddRolesToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superadmin_role, :boolean, default: false
    add_column :users, :admin_role, :boolean, default: false
    add_column :users, :producer_role, :boolean, default: false
    add_column :users, :contributor_role, :boolean, default: false
  end
end
