class AddExcerciseYearToLogs < ActiveRecord::Migration[5.1]
  change_table :logs do |t|
    t.references :excercise_year, foreign_key: true
  end
end
