class ContactController < ApplicationController
  def new
    @laurel = User.find_by(slug:params[:slug])
  end

  def create
    @laurel = User.find_by(slug:params[:slug])
    if verify_recaptcha
      if params['contact']['message'].present?
        # *contact_params.values explodes items out of the array
        LaurelMailer.contact_laurel(@laurel, *contact_params.values).deliver 
        flash.notice = "email successfully sent"
        redirect_to laurel_path
      else
        flash.alert = "not sending email - message must be present"
        render 'new'
      end
    else
      render 'new'
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:subject, :from_name, :from_email, :message)
  end
end
