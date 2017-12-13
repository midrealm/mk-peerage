class Chambers::Pelican::Admin::PelicansController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  helper_method :peerage
  def new
  end
  def index
    @users = Pelican.all
  end
  def create
    @pelican = User.find_or_initialize_by(pelican_params)
    if @pelican.id.nil?
      pwd = Devise.friendly_token.first(8)  
      @pelican.password = pwd 
    end
    if @pelican.save
      Peer.create(user: @pelican, active: true, type: 'Laurel') do |p|
        p.vigilant = true if params[:pelican][:vigilant].nil?
      end
      redirect_to pelican_path(@pelican.slug)
      if @pelican.peers.count == 1
        @pelican.send_reset_password_instructions
      else
        PeerageMailer.add_to_peerage(@pelican,:pelican).deliver
      end
    else
      render :new
    end
  end
  def edit
    @peer = Peer.find(params[:id])
    raise "Access Denied" unless @peer.type == 'Pelican'
  end
  def update
    @user = User.find(params[:id])
    if @user.update(update_pelican_params)
      redirect_to chambers_pelican_admin_pelicans_path  
    else
      render :edit
    end
  end
  private
  def pelican_params
    params.require(:pelican).permit(:sca_name, :email)
  end
  def update_pelican_params
    params.require(:pelican).permit(:deceased)
  end
  def authorize_admin
    authorize! :manage, :pelican
  end
  def peerage
    'pelican'
  end
  def self.controller_path
    'chambers/peerage/admin/peers'
  end
  
end
