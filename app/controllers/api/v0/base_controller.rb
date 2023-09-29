class Api::V0::BaseController < ApplicationController
  before_action :authenticate_user

  private
  def authenticate_user
    authenticate_or_request_with_http_token do |token, _options|
      @current_user = User.find_by(authentication_token: token)
    end
  end
end
