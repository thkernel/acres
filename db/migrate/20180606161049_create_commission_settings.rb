class CreateCommissionSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :commission_settings do |t|
      t.float :commission_percentage, default: 0.0
      t.float :hypoplus_commission_percentage, default: 0.0
      t.float :first_installment , default: 0.0 # première tranche
      t.integer :number_of_dates, default: 0 #nombre d'écheance
      t.string :slug, unique: true
      t.references :user, foreign_key: true, null: false, index: {unique: true}

      t.timestamps
    end
    
  end
end
