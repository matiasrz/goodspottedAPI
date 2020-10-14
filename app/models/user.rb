class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable, :lockable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :first_name, :last_name, presence: true, on: :create

  def on_jwt_dispatch(token, payload)
    super
  end
end
