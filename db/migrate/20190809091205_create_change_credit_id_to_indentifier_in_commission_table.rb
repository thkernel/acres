class CreateChangeCreditIdToIndentifierInCommissionTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :commissions , :credit_id, :identifier

  end
end
