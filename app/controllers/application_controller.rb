class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :peerage

  def after_sign_in_path_for(resource)
    chambers_path
  end

  def peerage
    PeerageParamHandler.new(params[:peerage]).peerage
  end
end
