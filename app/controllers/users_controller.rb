class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
    @specialties = Specialty.all
  end
  def index
    @user = current_user
  end
  def new
    @user = User.new
    authorize! :manage, :all
  end
  def update
    if current_user.update(user_params)
      name = current_user.sca_name.tr(' ','_')
      redirect_to "/laurels/#{name}"
    else
      render :edit
    end
  end
  def create
    @user = User.new(new_user_params)
    pwd = Devise.friendly_token.first(8)  
    @user.password = pwd
    if @user.save
      name = @user.sca_name.tr(' ','_')
      redirect_to "/laurels/#{name}"
      @user.send_reset_password_instructions
    else
      render :new
    end
  end

  private 
  def new_user_params
    params.require(:user).permit(:sca_name, :email)
  end
  def user_params
    params.require(:user).permit(:sca_name, :modern_name, {:laurel_ids => [] }, {:specialty_ids => [] }, :street, :city, :state, :zipcode, :elevators,:phone,:user_id, :vigilant, :active, :elevation_date, :bio, :arms, :profile_pic, :apprenticed_to, :group_id)
  end
end
