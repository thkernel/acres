class CreateRenameCreditDetailsCredituid < ActiveRecord::Migration[5.1]
  def change
    rename_column :credit_details, :creditUid, :credit_uid
  end
end
