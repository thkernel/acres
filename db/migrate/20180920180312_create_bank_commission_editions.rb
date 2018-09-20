class CreateBankCommissionEditions < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_commission_editions do |t|
      t.date :date_effet
      t.string :completed, default: "no"
      t.float   :old_value
      t.float   :new_value
      t.references :bank, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
