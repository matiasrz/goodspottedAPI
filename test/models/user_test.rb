# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  first_name         :string(255)      default(""), not null
#  last_name          :string(255)      default(""), not null
#  email              :string(255)      default(""), not null
#  encrypted_password :string(255)      default(""), not null
#  sign_in_count      :integer          default(0), not null
#  current_sign_in_at :datetime
#  last_sign_in_at    :datetime
#  current_sign_in_ip :string(255)
#  last_sign_in_ip    :string(255)
#  failed_attempts    :integer          default(0), not null
#  unlock_token       :string(255)
#  locked_at          :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
