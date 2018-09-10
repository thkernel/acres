class CreateAppConfigs < ActiveRecord::Migration[5.1]
  def change
    create_table :app_configs do |t|
      t.string :name , unique: true
      t.string :url , unique: true
      t.string :icon
      t.references :user, foreign_key: true, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
