# frozen_string_literal: true

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
RSpec.describe User, type: :model do
  context 'Bussiness Rules' do
    describe 'Validations' do
      User.create! first_name: 'First Name', last_name: 'Last Name',
                   email: '1@2.com', password: '123456'

      it { should validate_presence_of(:first_name) }
      it { should validate_presence_of(:last_name) }
    end
  end
end
