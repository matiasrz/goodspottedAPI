# == Schema Information
#
# Table name: countries
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Country < ApplicationRecord
  has_many :stores
end
