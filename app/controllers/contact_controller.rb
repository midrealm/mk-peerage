class ContactController < ApplicationController
  def new
    @laurel = User.find_by(slug:params[:slug])
  end

  def create
    @laurel = User.find_by(slug:params[:slug])
    # *contact_params.values explodes items out of the array
    LaurelMailer.contact_laurel(@laurel, *contact_params.values).deliver 
  end

  private
  def contact_params
    params.require(:contact).permit(:subject, :from_name, :from_email, :message)
  end
end
