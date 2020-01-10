class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :peerage

  Warden::Manager.after_authentication do |user,auth,opts|
    if !user.has_logged_in
      user.update(has_logged_in: true)
      user.peers.each do |p|
        p.update(active: true)
      end
    end
  end

  def after_sign_in_path_for(resource)
    chambers_path
  end

  def peerage
    PeerageParamHandler.new(params[:peerage]).peerage
  end
  private
  def authorize_admin
    authorize! :manage, peerage
  end
end
