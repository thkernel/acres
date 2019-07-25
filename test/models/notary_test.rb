# == Schema Information
#
# Table name: notaries
#
#  id                :bigint           not null, primary key
#  full_name         :string
#  address           :string
#  phone             :string
#  email             :string
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  excercise_year_id :bigint           default(0)
#

require 'test_helper'

class NotaryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
