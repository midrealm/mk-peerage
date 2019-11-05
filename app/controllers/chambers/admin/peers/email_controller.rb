class Chambers::Admin::Peers::EmailController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  def new
    @peers = Peer.where_order(peerage).map{|x| ["#{x.sca_name} (#{x.email})", x.user.id] }
  end
  def create
    @peers = Peer.where_order(peerage).map{|x| ["#{x.sca_name} (#{x.email})", x.user.id] }
    @user = User.find(params[:id])
    if @user.update(email: params[:email])
       if @user.send_reset_password_instructions
          flash[:success] = 'Email Changed and Reset Password Instructions Sent'
          redirect_to chambers_path 
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
