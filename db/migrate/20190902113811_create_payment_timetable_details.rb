class CreatePaymentTimetableDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_timetable_details do |t|
      t.references :payment_timetable, foreign_key: true
      t.string :installment_payment
      t.date :installment_date
      t.float :commission, default: 0.0
      t.float :cumulative_amount, default: 0.0
      t.string :paid_by_bank, default: 'Non'
      t.string :paid_to_contributor_or_producer, default: 'Non'
      t.string :status

      t.timestamps
    end
  end
end
