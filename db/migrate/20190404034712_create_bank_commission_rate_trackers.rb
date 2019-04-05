class CreateBankCommissionRateTrackers < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_commission_rate_trackers do |t|
      t.datetime :start_date
      t.float :old_rate, default: 0.0
      t.float :new_rate, default: 0.0
      t.references :bank, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status,  default: 'enable'

      t.timestamps
    end
  end
end
