# frozen_string_literal: true

# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
RSpec.describe Country, type: :model do
  context 'Bussiness Rules' do
    describe 'Associations' do
      it { should have_many(:stores) }
    end

    describe 'Validations' do
      Country.create! name: Faker::Commerce.unique.product_name

      it { should validate_uniqueness_of(:name) }
      it { should validate_presence_of(:name) }
    end
  end
end
