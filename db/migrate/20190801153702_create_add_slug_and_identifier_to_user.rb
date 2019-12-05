class CreateAddSlugAndIdentifierToUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :slug 
      t.string :identifier
    end
  end
end
