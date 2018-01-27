require 'i18n'
class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @peerage = params['peerage']
    @user = current_user
    @specialties = Specialty.all
  end
  def index
    @user = current_user
  end
  def update
    if current_user.update(user_params)
      redirect_to chambers_path
      flash.notice = 'Profile Successfully Updated'
    else
      render :edit
    end
  end
  private 
  
  def user_params
    peer_params = [:id, {:specialty_ids => [] }, :specialty_detail, :bio, :elevated_by, :active, :vigilant, :apprenticed_to, :elevation_date, :profile_pic, {:superior_ids => []}]
    all_peer_params =  Peer.orders.map{|x| {"#{x}_attributes".to_sym => peer_params}}

    params.require(:user).permit(:sca_name, :modern_name, :street, :city, :state, :zipcode, :elevators,:phone,:user_id,  :arms, :group_id, 
      *all_peer_params)
  end
end
