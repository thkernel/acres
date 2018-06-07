class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :file_name
      t.float :no_record
      t.string :error
      t.boolean :status
      t.string :slug, unique: true
      t.references :user, foreign_key: true, null: false, index: true


      t.timestamps
    end
  end
end
