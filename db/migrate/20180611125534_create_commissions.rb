class CreateCommissions < ActiveRecord::Migration[5.1]
  def change
    create_table :commissions do |t|
      t.bigint   :credit_id, unique: true

      t.date :production_date
      t.date :acte_date
      t.integer :customer_id
      t.string :notary_name

      t.string   :bank_name
      t.string   :contributor_name
      t.string   :producer_name
      t.string   :company_name

      t.float  :contributor_commission_percentage, default: 0.0
      t.float    :contributor_commission , default: 0.0

      t.float  :producer_commission_percentage, default: 0.0
      t.float    :producer_commission , default: 0.0

      t.float  :bank_commission_percentage, default: 0.0
      t.float    :bank_commission, default: 0.0

      t.float  :company_commission_percentage , default: 0.0
      t.float    :company_commission , default: 0.0

      t.float    :amount_credit, default: 0.0
      t.float    :total_amount, default: 0.0

      t.references :user, foreign_key: true, null: false, index:  true


      t.timestamps
    end
  end
end
