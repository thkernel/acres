class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :company,  unique:  true, null: false
      t.string :subdomain, unique:  true, null: false
      t.boolean :status
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
