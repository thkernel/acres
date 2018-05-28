class AddUserIndexToFewEntity < ActiveRecord::Migration[5.1]
  def change
    add_reference :banks, :user, null: false, index: {unique: true}
    add_reference :customers, :user, null: false,index: {unique: true}
    add_reference :profiles, :user, null: false, index: {unique: true}
    add_reference :credits, :user, null: false, index: {unique: true}
    #add_reference :companies, :user, null: false, index: {unique: true}
    add_reference :logs, :user, null: false, index: {unique: true}
  end
end
