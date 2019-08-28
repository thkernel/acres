# == Schema Information
#
# Table name: borderaus
#
#  id                :bigint           not null, primary key
#  name              :string
#  installment       :integer
#  file_name         :string
#  credit_identifier :string
#  excercise_year_id :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class BorderauTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
