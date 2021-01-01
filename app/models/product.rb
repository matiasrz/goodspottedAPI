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
class Product < ApplicationRecord
  belongs_to :product_prospect
  has_many :product_stores
  has_many :stores, through: :product_stores

  validates :name, presence: true, uniqueness: { case_sensitive: true }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
