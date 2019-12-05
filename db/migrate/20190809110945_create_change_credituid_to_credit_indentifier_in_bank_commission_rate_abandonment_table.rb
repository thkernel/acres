class CreateChangeCredituidToCreditIndentifierInBankCommissionRateAbandonmentTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :bank_commission_rate_abandonments , :credituid, :credit_identifier

  end
end
