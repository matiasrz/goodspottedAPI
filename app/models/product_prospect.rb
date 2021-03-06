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
class ProductProspect < ApplicationRecord
  enum status: %i[pending manually_revision approved]

  has_one :product

  validates :name, :position, :country, :store, presence: true
  validates :name, uniqueness: { case_sensitive: true } 
end
