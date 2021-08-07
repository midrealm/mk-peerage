class Chambers::Admin::Peers::EmailController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  def new
    @user = User.find_by_id(params[:user_id])
    redirect_to chambers_admin_peers_path(peerage) if @user.nil?
  end
  def create
    @peers = Peer.where_order(peerage).map{|x| ["#{x.sca_name} (#{x.email})", x.user.id] }
    @user = User.find(params[:id])
    if @user.update(email: params[:email])
       token = @user.send_reset_password_instructions
       if token
         flash[:success] = "<b>Email Changed for #{@user.sca_name}</b><br> Change Password Link:<br> #{edit_password_url(@user, reset_password_token: token)}"
          redirect_to chambers_admin_peers_path(peerage)
        else
          flash[:error] = 'Email changed, but reset password instructions failed to send'
          render 'new' 
        end
    else
      flash[:error] = "Failed to Change Email Address"
      render 'new' 
    end
  end
private
  def self.controller_path
    'chambers/peerage/admin/peers/email'
  end
  def authorize_admin
    authorize! :manage, peerage
  end
end
