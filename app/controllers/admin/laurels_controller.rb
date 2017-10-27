module Admin
  class LaurelsController < ApplicationController
    before_action :authenticate_user!
    def new
      authorize! :manage, :all
    end
    def index
      authorize! :manage, :all
      @users = Peer.all
    end
  def create
    authorize! :manage, :all
    @laurel = User.new(laurel_params)
    pwd = Devise.friendly_token.first(8)  
    @laurel.password = pwd
    if @laurel.save
      Peer.create(user: @laurel, active: true, type: 'Laurel') do |p|
        p.vigilant = true if params[:laurel][:vigilant].nil?
      end
      redirect_to "/laurels/#{@laurel.slug}"
      @laurel.send_reset_password_instructions
    else
      render :new
    end
  end
  def edit
    @laurel = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(update_laurel_params)
      redirect_to admin_laurels_path  
    else
      render :edit
    end
  end
    private
    def laurel_params
      params.require(:laurel).permit(:sca_name, :email)
    end
    def update_laurel_params
      params.require(:laurel).permit(:deceased)
    end
  end
end

