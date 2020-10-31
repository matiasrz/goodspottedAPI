# == Schema Information
#
# Table name: allowlisted_jwts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  jti        :string(255)      not null
#  aud        :string(255)      not null
#  exp        :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AllowlistedJwt < ApplicationRecord
  after_create_commit :revocation_schedule

  belongs_to :user

  private

  def revocation_schedule
    RevokeJwtWorker.perform_at(exp, id) if id.present?
  end
end
