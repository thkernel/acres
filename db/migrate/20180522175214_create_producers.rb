class CreateProducers < ActiveRecord::Migration[5.1]
  def change
    create_table :producers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :phone
      t.string :email
      t.string :city
      t.string :country
      t.text :notes

      t.timestamps
    end
  end
end
