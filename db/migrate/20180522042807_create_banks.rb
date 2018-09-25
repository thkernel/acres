class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :name #, unique: true
      t.string :description
      t.float :commission_percentage, default: 0.0
      t.float :hypoplus_commission_percentage, default: 0.0
      t.float :first_installment , default: 0.0 # première tranche
      t.integer :number_of_dates , default: 0 #nombre d'écheance
      t.string :phone
      t.string :address
      t.string :slug, unique: true
      t.references :user, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end
