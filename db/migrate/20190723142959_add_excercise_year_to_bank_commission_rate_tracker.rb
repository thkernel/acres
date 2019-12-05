class AddExcerciseYearToBankCommissionRateTracker < ActiveRecord::Migration[5.1]
  change_table :bank_commission_rate_trackers do |t|
    t.references :excercise_year, foreign_key: true
  end
end
