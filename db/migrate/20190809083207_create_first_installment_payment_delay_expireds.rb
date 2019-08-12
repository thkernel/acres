class CreateFirstInstallmentPaymentDelayExpireds < ActiveRecord::Migration[5.1]
  def change
    create_table :first_installment_payment_delay_expireds do |t|
      t.bigint :credit_identifier
      t.datetime :expiration_date
      t.float :first_installment_percentage, default: 0.0
      t.float :installment_amount, default: 0.0
      t.float :credit_amount, default: 0.0
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
