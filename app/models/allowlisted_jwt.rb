class AllowlistedJwt < ApplicationRecord
  after_create_commit :revocation_schedule

  belongs_to :user

  private

  def revocation_schedule
    RevokeJwtWorker.perform_async(id) if id.present?
  end
end
