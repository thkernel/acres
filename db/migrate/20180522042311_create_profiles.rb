class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :user
      #t.string :slug, unique: true
      #t.attachment  :avatar

      t.timestamps
    end
    add_index :profiles, :user
  end
end
