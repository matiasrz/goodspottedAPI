# frozen_string_literal: true

# == Schema Information
#
# Table name: stores
#
#  id         :bigint           not null, primary key
#  country_id :bigint           not null
#  name       :string(255)      not null
#  latitude   :string(255)      not null
#  longitude  :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
RSpec.describe Store, type: :model do
  context 'Bussiness Rules' do
    describe 'Associations' do
      it { should belong_to(:country) }
      it { should have_many(:product_stores) }
      it { should have_many(:products).through(:product_stores) }
    end

    describe 'Validations' do
      Store.create! name: Faker::Commerce.unique.product_name, latitude: '1',
                    longitude: '2', country: Country.first

      it { should validate_uniqueness_of(:name) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:latitude) }
      it { should validate_presence_of(:longitude) }
    end
  end
end
