class CreateFirstInstallmentPaymentDelayExpireds < ActiveRecord::Migration[5.1]
  def change
    create_table :first_installment_payment_delay_expireds do |t|
      t.bigint :credit_identifier
      t.datetime :expiration_date
      t.string :installment
      t.string :target
      t.float :payment_amount, default: 0.0
      t.string :status
      t.bigint :excercise_year_id

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
