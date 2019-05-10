class CreateUserCommissionRateTrackers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_commission_rate_trackers do |t|
      t.datetime :start_date
      t.float :old_rate
      t.float :new_rate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
