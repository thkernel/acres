class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.date :production_date
      t.date :acte_date
      t.integer :customer_id
      t.integer :bank_id
      t.float :amount

      t.timestamps
    end
  end
end
