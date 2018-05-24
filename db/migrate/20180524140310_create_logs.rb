class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :file_name
      t.float :no_record
      t.string :error
      t.boolean :status

      t.timestamps
    end
  end
end
