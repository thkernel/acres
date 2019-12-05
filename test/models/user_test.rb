# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  full_name              :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :bigint
#  avatar_updated_at      :datetime
#  role                   :string           not null
#  status                 :string           default("enable"), not null
#  receives_notifications :boolean          default(FALSE)
#  created_by             :bigint
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  receives_summaries     :boolean          default(FALSE)
#  slug                   :string
#  identifier             :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
