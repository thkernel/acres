class CreateConfigOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :config_options do |t|
      t.string :app_name
      t.string :admin_name
      t.string :admin_email
      t.string :admin_password
      t.string :admin_role, default: 'Admin'

      t.timestamps
    end
  end
end
