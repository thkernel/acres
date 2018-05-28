class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.string :phone
      t.references :user , null: false, index: {unique: true}
      t.string :slug, unique: true
      t.attachment :brand

      t.timestamps
    end
  end
end
