class ContactController < ApplicationController
  def new
    @user = User.find_by(slug:params[:slug])
  end

  def create
    @user = User.find_by(slug:params[:slug])
    if verify_recaptcha
      if params['contact']['message'].present?
        # *contact_params.values explodes items out of the array
        PeerageMailer.contact_user(@user, *contact_params.values).deliver 
        flash[:success]= "email successfully sent"
        redirect_to peer_path(peerage,params[:slug])
      else
        flash[:error] = "not sending email - message must be present"
        render :new
      end
    else
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:subject, :from_name, :from_email, :message)
  end
end
