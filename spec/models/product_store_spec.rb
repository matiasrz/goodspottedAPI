# frozen_string_literal: true

# == Schema Information
#
# Table name: product_stores
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  store_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
RSpec.describe ProductStore, type: :model do
  context 'Bussiness Rules' do
    describe 'Associations' do
      it { should belong_to(:product) }
      it { should belong_to(:store) }
    end
  end
end
