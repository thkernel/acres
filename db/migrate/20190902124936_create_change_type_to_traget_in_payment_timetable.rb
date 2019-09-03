class CreateChangeTypeToTragetInPaymentTimetable < ActiveRecord::Migration[5.1]
  def change
    rename_column :payment_timetables , :type, :target

  end
end



