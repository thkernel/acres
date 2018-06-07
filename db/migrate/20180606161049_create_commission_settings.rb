class CreateCommissionSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :commission_settings do |t|
      t.integer :commission_percentage
      t.integer :hypoplus_commission_percentage
      t.integer :first_installment # première tranche
      t.integer :number_of_dates #nombre d'écheance
      t.references :user, foreign_key: true, null: false, index: {unique: true}

      t.timestamps
    end
    
  end
end
