class SetupController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(sca_name: params[:sca_name])
    if @user&.email == params[:email]
      session[:send_setup_email] = true
      @user.send_reset_password_instructions('setup')
      redirect_to root_path      
      flash[:success] = "Account Found. Password Change Email will be sent to #{params[:email]} shortly."
    else
      flash[:error] = "SCA Name and email combination not found. To rectify this, please send an email to Mistress Jadwiga: nique.rio@gmail.com"
      render :new 
    end
  end 
end
