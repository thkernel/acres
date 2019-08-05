class CreateRenameCreditDetailsCreditUid < ActiveRecord::Migration[5.1]
  def change
    rename_column :credit_details, :credit_uid, :credituid

  end
end
