class AddExcerciseYearIdToCommissionSetting < ActiveRecord::Migration[5.1]
  change_table :commission_settings do |t|
    t.references :excercise_year, foreign_key: true
  end
end
