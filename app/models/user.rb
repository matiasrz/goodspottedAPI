class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable, :lockable, :trackable

  validates :first_name, :last_name, presence: true, on: :create
end
