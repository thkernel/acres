class CreateCreditDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_details do |t|
      t.string :installment_payment
      t.date :installment_date
      t.float :commission, default: 0.0
      t.float :cumulative_amount, default: 0.0
      t.string :paid_by_bank, default: 'Non'
      t.string :paid_to_contributor_or_producer, default: 'Non'
      t.bigint :creditUid, null: false 
      t.references :credit, foreign_key: true, null: false , index:  true
      
      #t.references :user, null: false #, index:  true
      t.timestamps
    end
  end
end
