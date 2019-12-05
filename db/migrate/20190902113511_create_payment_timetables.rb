class CreatePaymentTimetables < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_timetables do |t|
      t.string :type
      t.string :credit_identifier
      t.references :excercise_year, foreign_key: true

      t.timestamps
    end
  end
end
