class AddNumberOfRemainingDaysToBank < ActiveRecord::Migration[5.1]
  def change
    change_table :banks do |t|
      t.integer :number_of_remaining_days, default: 0 #nombre d'écheance
    end
  end
end
