class CreateMonthlyPaymentDelayExpireds < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_payment_delay_expireds do |t|
      t.bigint :credit_identifier
      t.datetime :expiration_date
      t.bigint :installment_identifier
      t.float :payment_amount, default: 0.0
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
