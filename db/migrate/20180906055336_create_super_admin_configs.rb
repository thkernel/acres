class CreateSuperAdminConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :super_admin_configs do |t|
      t.string :login, unique: true
      t.string :email, unique: true
      t.string :password
      t.timestamps
    end
  end
end
