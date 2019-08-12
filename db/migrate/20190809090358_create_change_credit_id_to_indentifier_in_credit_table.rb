class CreateChangeCreditIdToIndentifierInCreditTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :credits , :credit_id, :identifier
  end
end
