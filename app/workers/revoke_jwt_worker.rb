class RevokeJwtWorker
  include Sidekiq::Worker
  sidekiq_options queue: :low

  def perform(jwt_id)
    jwt = AllowlistedJwt.find_by id: jwt_id

    logger.info "RevokeJwtWorker() |#{Time.now}| Checking JWT match between database and id param."
    return unless jwt.present?

    jwt.delete
  end
end
