class AlterCommissionTable < ActiveRecord::Migration[5.1]
  def change
    change_table :commissions do |t|
      t.date :production_date
      t.date :acte_date
      t.integer :customer_id
      t.string :notary_name
    end

  end
end
