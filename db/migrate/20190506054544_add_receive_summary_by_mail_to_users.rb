class AddReceiveSummaryByMailToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.boolean :receives_summaries, default: false
    end
  end
end
