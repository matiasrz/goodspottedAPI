class ApplicationController < ActionController::API
  before_action :constraint_json
  # before_action :authenticate_user!

  private

  def constraint_json
    # head(:not_acceptable) && return unless params[:format].eql?('json')
    head(:not_acceptable) && return unless request.content_type.eql?('application/json')
  end
end
