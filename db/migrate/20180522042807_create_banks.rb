class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :description
      t.integer :commission_percentage
      t.integer :hypoplus_commission_percentage
      t.integer :first_installment # première tranche
      t.integer :number_of_dates #nombre d'écheance
      t.string :phone
      t.string :address
      t.references :user, null: false, index:  true

      t.timestamps
    end
  end
end
