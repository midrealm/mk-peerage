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
    current_user.assign_attributes(user_params)
    attach_profile_pic
    if current_user.save
      redirect_to chambers_path
      flash[:success] = 'Profile Successfully Updated'
    else
      render :edit
    end
  end

	def edit_password
		@user = current_user
	end

	def update_password
		@user = current_user
		if @user.update_with_password(password_params)
			bypass_sign_in(@user)
			redirect_to chambers_path
      flash[:success] = 'Password Successfully Updated'
		else
			render 'edit_password'
		end
	end
  private 
  
  def user_params
    peer_params = [:id, {:specialty_ids => [] }, :specialty_detail, :bio, :elevated_by, :active, :vigilant, :dependent_of, :elevation_date, {:superior_ids => []}]
    all_peer_params =  Peer.orders.map{|x| {"#{x}_attributes".to_sym => peer_params}}

    params.require(:user).permit(:user_id, :email, :sca_name, :modern_name, 
      :elevators, :arms, :group_id, 
			#:street, :city, :state, :zipcode, :phone,
      *all_peer_params)
  end

	def password_params
		params.require(:user).permit(:current_password, :password, :password_confirmation)
	end

  def attach_profile_pic
    Peer.orders.each do |p| 
      profile_pic = params.dig("user", "#{p}_attributes", "profile_pic")
      if profile_pic.present?
        headers, data = profile_pic.split(',')
        headers =~ /^data:(.*?)$/
        content_type = Regexp.last_match(1).split(';base64').first
        current_user.send(p).profile_pic.attach(io: StringIO.new(Base64.decode64(data)), filename: Time.current.to_i.to_s, content_type: content_type) 
      end
    end
  end
end
