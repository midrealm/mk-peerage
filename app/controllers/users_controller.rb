require 'i18n'
class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @user = current_user
    @peerages = @user.peers.pluck(:type)
    #@specialties = Specialty.all
  end
  def index
    @user = current_user
    @poll = Poll.last
  end
  def update
    if current_user.update(user_params)
      redirect_to current_user.url
    else
      redirect_to action: 'edit'
    end
  end
  private 
  def user_params

    
    peer_attributes = [ :specialty_detail, :active, :vigilant, :elevated_by, :elevation_date, :bio, :profile_pic, :id ]

    params.require(:user).permit(:sca_name, :modern_name, :street, :city, :state, :zipcode, :phone,:user_id,  :arms, :group_id, 
    :laurel_attributes => peer_attributes, :knight_attributes => peer_attributes, :pelican_attributes => peer_attributes, :defense_attributes => peer_attributes
     )
  end
end
