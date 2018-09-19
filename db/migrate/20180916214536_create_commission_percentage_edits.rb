class CreateCommissionPercentageEdits < ActiveRecord::Migration[5.1]
  def change
    create_table :commission_percentage_edits do |t|
      t.date :date_effet
      t.float   :old_value
      t.float   :new_value
      t.string  :is_completed, default: "no"
      t.references :bank, foreign_key: true, null: false

      t.timestamps
    end
  end
end
