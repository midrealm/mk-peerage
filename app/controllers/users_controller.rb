class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
    @specialties = Specialty.all
  end
  def update
    if current_user.update(user_params)
      name = current_user.sca_name.tr(' ','_')
      redirect_to "/laurels/#{name}"
    else
      render :edit
    end
  end

  private 
  def user_params
    params.require(:user).permit(:sca_name, :modern_name, {:specialty_ids => [] }, :street, :city, :state, :zipcode, :elevators,:phone,:user_id, :vigilant, :active, :elevation_date, :bio)
  end
end
