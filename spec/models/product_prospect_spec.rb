# frozen_string_literal: true

# == Schema Information
#
# Table name: product_prospects
#
#  id         :bigint           not null, primary key
#  status     :integer          default("pending"), not null
#  name       :string(255)      not null
#  price      :decimal(5, 3)    not null
#  position   :string(255)
#  country    :string(255)
#  store      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
RSpec.describe ProductProspect, type: :model do
  context 'Bussiness Rules' do
    describe 'Associations' do
      it { should have_one(:product) }
    end

    describe 'Validations' do
      ProductProspect.create! name: Faker::Commerce.unique.product_name, price: 9,
                              position: '1,2', country: 'Denmark', store: 'Netto'

      it { should validate_uniqueness_of(:name) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:position) }
      it { should validate_presence_of(:country) }
      it { should validate_presence_of(:store) }
    end
  end
end
