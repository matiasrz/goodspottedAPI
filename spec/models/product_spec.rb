# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  product_prospect_id :bigint           not null
#  name                :string(255)      not null
#  price               :decimal(5, 3)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
RSpec.describe Product, type: :model do
  context 'Bussiness Rules' do
    describe 'Associations' do
      it { should belong_to(:product_prospect) }
      it { should have_many(:product_stores) }
      it { should have_many(:stores).through(:product_stores) }
    end

    describe 'Validations' do
      Product.create! name: Faker::Commerce.unique.product_name, price: 9,
                      product_prospect: ProductProspect.first

      it { should validate_uniqueness_of(:name) }
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:price) }
      it { should validate_numericality_of(:price).only_integer.is_greater_than(0) }
    end
  end
end
