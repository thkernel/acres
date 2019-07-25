class AddExcerciseYearToCommissions < ActiveRecord::Migration[5.1]
  change_table :commissions do |t|
    t.references :excercise_year, foreign_key: true
  end
end
