class Chambers::Admin::Peers::PasswordController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  def create
    @user = User.find(params[:id])
    token = @user.send_reset_password_instructions
    if token
      flash[:success] = "<b>Reset Password Instructions Sent to #{@user.sca_name}</b> <br> Change Password Link:<br> #{edit_password_url(@user, reset_password_token: token)}"
    else
      flash[:error] = "Couldn't Send Reset Password Instructions"
    end
    redirect_to chambers_admin_peers_path(peerage)
  end
private
  def self.controller_path
    'chambers/peerage/admin/peers/password'
  end
  def authorize_admin
    authorize! :manage, peerage
  end
end
