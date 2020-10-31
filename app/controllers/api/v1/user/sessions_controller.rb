# frozen_string_literal: true

class Api::V1::User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_action :verify_signed_out_user, only: :destroy

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource_json, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  def destroy
    auth_token = request.headers.env['HTTP_AUTHORIZATION'].split('Bearer ').last
    jwt_error && return if auth_token.blank?

    jwt = AllowlistedJwt.find_by jti: token_jti(auth_token)
    jwt_error && return if jwt.blank?

    jwt.destroy
    sign_out(jwt.user)
    render json: { message: 'Signed out.' }, status: 200
  end

  private

  def token_jti(auth_token)
    b64_decode = Base64.decode64(auth_token.split('.')[1])
    payload = JSON.parse(b64_decode)
    payload['jti']
  end

  def jwt_error
    render json: { message: 'Unknown or Revocated JWT.' }
  end

  def resource_json
    { firstName: resource.first_name, lastName: resource.last_name, email: resource.email }
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
