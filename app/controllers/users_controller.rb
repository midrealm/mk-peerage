require 'i18n'
class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
    @specialties = Specialty.all
  end
  def index
    @user = current_user
    @poll = Poll.last
  end
  def update
    if current_user.update(user_params)
      redirect_to current_user.url
    else
      render :edit
    end
  end
  private 
  def user_params
    peer_params = [:specialty_detail, :bio, :elevated_by, :active, :vigilant, :apprenticed_to, :elevation_date]
    params.require(:user).permit(:sca_name, :modern_name, {:laurel_ids => [] }, {:specialty_ids => [] }, :specialty_detail, :street, :city, :state, :zipcode, :elevators,:phone,:user_id, :vigilant, :active, :elevation_date, :bio, :arms, :apprenticed_to, :group_id, :peer_attributes => peer_params)
  end
end
