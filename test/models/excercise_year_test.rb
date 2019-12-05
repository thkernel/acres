# == Schema Information
#
# Table name: excercise_years
#
#  id         :bigint           not null, primary key
#  name       :string
#  start_date :date
#  end_date   :date
#  status     :string
#  close_at   :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ExcerciseYearTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
