class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.string :slug, unique: true
      t.attachment :avatar
      t.references :user, foreign_key: true, null: false, index:  true


      t.timestamps
    end
  end
end
