class CreateNotaries < ActiveRecord::Migration[5.1]
  def change
    create_table :notaries do |t|
      t.string :full_name
      t.string :address
      t.string :phone
      t.string :email
      t.references :user, foreign_key: true, null: false, index:  true

      t.timestamps
    end
  end
end
