class CreatePaymentDelays < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_delays do |t|
      t.string :first_installment
      t.integer :monthly_deadlines_before_payment
      t.string :monthly_installments
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
