class RemoveExcerciseYearColumnIntoNotary < ActiveRecord::Migration[5.1]
  def change
    remove_column :notaries, :excercise_year_id

  end
end
