class CreateChangeIdentifierToCreditIndentifierInCommissionTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :commissions , :identifier, :credit_identifier

  end
end
