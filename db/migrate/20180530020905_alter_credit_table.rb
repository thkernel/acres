class AlterCreditTable < ActiveRecord::Migration[5.1]
  def change
    add_column :credits, :bank_name, :string
    add_column :credits, :customer_name, :string
    add_column :credits, :producer_id, :integer
    add_column :credits, :producer_name, :string
    add_column :credits, :contributor_id, :integer
    add_column :credits, :contributor_name, :string
    add_column :credits, :notary_name, :string
    add_column :credits, :hypoplus, :string
  end
end
