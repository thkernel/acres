class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :slug, unique: true
      t.attachment  :avatar
      t.references :user , null: false, index: {unique: true}

      t.timestamps
    end
    
  end
end
