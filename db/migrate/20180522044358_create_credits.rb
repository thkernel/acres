class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.bigint :credit_id
      t.date :production_date
      t.date :acte_date
      t.integer :customer_id
      t.integer :bank_id
      t.float :amount
      t.string :bank_name
      t.string :customer_name
      t.integer :producer_id
      t.string :producer_name
      t.integer :contributor_id
      t.string :contributor_name
      t.string :notary_name
      t.string :hypoplus
      
      # Total commission
      t.float :total_commission_bank
      t.float :total_commission_producer
      t.float :total_commission_contributor
      t.float :total_commission_company
      
      t.string :slug, unique: true
      t.references :user, foreign_key: true, null: false, index: {unique: true}

      t.timestamps
    end
  end
end
