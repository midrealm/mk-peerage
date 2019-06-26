class Chambers::Admin::Peers::PasswordController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  def new
    @peers = Peer.where_order(peerage).map{|x| ["#{x.sca_name} (#{x.email})", x.user.id] }
  end
  def create
    @user = User.find(params[:id])
    if @user.send_reset_password_instructions
      flash[:success] = 'Reset Password Instructions Sent'
      redirect_to chambers_path 
    else
      flash[:error] = "Couldn't Send Reset Password Instructions"
      render 'new' 
    end
  end
private
  def self.controller_path
    'chambers/peerage/admin/peers/password'
  end
  def authorize_admin
    authorize! :manage, peerage
  end
end
