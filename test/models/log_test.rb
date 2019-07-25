# == Schema Information
#
# Table name: logs
#
#  id                :bigint           not null, primary key
#  file_name         :string
#  no_record         :float
#  error             :string
#  status            :boolean
#  slug              :string
#  user_id           :bigint           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  excercise_year_id :bigint           default(0)
#

require 'test_helper'

class LogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
