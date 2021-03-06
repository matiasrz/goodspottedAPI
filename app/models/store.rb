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
class Store < ApplicationRecord
  belongs_to :country
  has_many :product_stores
  has_many :products, through: :product_stores

  validates :name, presence: true, uniqueness: { case_sensitive: true }
  validates :latitude, :longitude, presence: true
end
