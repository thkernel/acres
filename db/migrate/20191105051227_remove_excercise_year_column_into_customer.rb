class RemoveExcerciseYearColumnIntoCustomer < ActiveRecord::Migration[5.1]
  def change
    remove_column :customers, :excercise_year_id
  end
end
