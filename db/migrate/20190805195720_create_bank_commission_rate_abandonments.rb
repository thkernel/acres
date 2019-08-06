class CreateBankCommissionRateAbandonments < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_commission_rate_abandonments do |t|
      t.string :bank_name
      t.float :current_bank_rate, default: 0.0
      t.float :abandonment_rate, default: 0.0
      t.bigint :credituid
      t.references :excercise_year, foreign_key: true
      t.references :user, foreign_key: true


      t.timestamps
    end
  end
end
