class CreateExcerciseYears < ActiveRecord::Migration[5.1]
  def change
    create_table :excercise_years do |t|
      t.string :name
      t.date :start_date
      t.date  :end_date
      t.string :status
      t.string :close_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
