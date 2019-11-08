class CreateBankSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :bank_settings do |t|
      t.float :commission_percentage
      t.float :hypoplus_commission_percentage
      t.float :first_installment
      t.integer :number_of_dates
      t.integer :number_of_remaining_days
      t.float :company_remaining_commission_rate
      t.references :excercise_year, foreign_key: true
      t.references :bank, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
