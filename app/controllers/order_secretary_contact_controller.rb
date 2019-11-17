class OrderSecretaryContactController < ApplicationController
  def new
    @secretary = Peer.subclass(params[:peerage]).order_secretary
  end

  def create
    @secretary = Peer.subclass(params[:peerage]).order_secretary
    if verify_recaptcha
      if params['contact']['message'].present?
        # *contact_params.values explodes items out of the array
        PeerageMailer.contact_order_secretary(@secretary, *contact_params.values).deliver 
        flash[:success]= "email successfully sent"
        redirect_to order_path(peerage)
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
