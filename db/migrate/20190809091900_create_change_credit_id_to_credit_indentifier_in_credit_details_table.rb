class CreateChangeCreditIdToCreditIndentifierInCreditDetailsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :credit_details , :credituid, :credit_identifier

  end
end
