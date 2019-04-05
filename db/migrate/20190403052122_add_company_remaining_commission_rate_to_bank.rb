class AddCompanyRemainingCommissionRateToBank < ActiveRecord::Migration[5.1]
  def change
    change_table :banks do |t|
      t.float    :company_remaining_commission_rate , default: 0.0
    end
  end
end
