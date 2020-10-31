class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :constraint_json

  private

  def constraint_json
    # head(:not_acceptable) && return unless params[:format].eql?('json')
    head(:not_acceptable) && return unless request.accept.eql?('application/json')
  end
end
