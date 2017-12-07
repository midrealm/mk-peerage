class Chambers::Laurel::Admin::LaurelsController < ApplicationController
  before_action :authenticate_user!
  def new
    authorize! :manage, :laurel
  end
  def index
    authorize! :manage, :laurel
    @users = Laurel.all
  end
  def create
    authorize! :manage, :laurel
    @laurel = User.find_or_initialize_by(laurel_params)
    if @laurel.id.nil?
      pwd = Devise.friendly_token.first(8)  
      @laurel.password = pwd 
    end
    if @laurel.save
      Peer.create(user: @laurel, active: true, type: 'Laurel') do |p|
        p.vigilant = true if params[:laurel][:vigilant].nil?
      end
      redirect_to laurel_path(@laurel.slug)
      if @laurel.peers.count == 1
        @laurel.send_reset_password_instructions
      else
        PeerageMailer.add_to_peerage(@laurel,:laurel).deliver
      end
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
      redirect_to chambers_laurel_admin_laurels_path  
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
