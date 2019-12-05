class CreateBorderaus < ActiveRecord::Migration[5.1]
  def change
    create_table :borderaus do |t|
      t.string :name
      t.integer :installment
      t.string :file_name
      t.string :credit_identifier
      t.references :excercise_year, foreign_key: true

      t.timestamps
    end
  end
end
