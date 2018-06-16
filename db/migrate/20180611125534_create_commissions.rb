class CreateCommissions < ActiveRecord::Migration[5.1]
  def change
    create_table :commissions do |t|
      t.bigint   :credit_id, unique: true
      t.string   :bank_name
      t.string   :contributor_name
      t.string   :producer_name
      t.string   :company_name

      t.integer  :contributor_commission_percentage
      t.float    :contributor_commission 

      t.integer  :producer_commission_percentage
      t.float    :producer_commission 

      t.integer  :bank_commission_percentage
      t.float    :bank_commission

      t.integer  :company_commission_percentage 
      t.float    :company_commission 

      t.float    :amount_credit

      t.references :user, foreign_key: true, null: false, index:  true


      t.timestamps
    end
  end
end
