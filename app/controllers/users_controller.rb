require 'i18n'
class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
    @specialties = Specialty.all
  end
  def index
    @user = current_user
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
    params.require(:user).permit(:sca_name, :modern_name, {:laurel_ids => [] }, {:specialty_ids => [] }, :specialty_detail, :street, :city, :state, :zipcode, :elevators,:phone,:user_id, :vigilant, :active, :elevation_date, :bio, :arms, :profile_pic, :apprenticed_to, :group_id)
  end
end
