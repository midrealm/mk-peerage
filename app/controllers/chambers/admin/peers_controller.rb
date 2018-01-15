class Chambers::Admin::PeersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin
  helper_method :peerage
  def new
  end
  def index
    @users = Peer.where_order(peerage)
  end
  def create
    user = User.find_or_initialize_by(id: user_params['id'])
    if user.id.nil?
      pwd = Devise.friendly_token.first(8)  
      user.password = pwd 
      user.assign_attributes(user_params)
    end
    if user.save
      Peer.create(user: user, active: true, vigilant: params[peerage][:vigilant], type: peerage.to_s.capitalize) do |p|
        p.vigilant = true if params[peerage][:vigilant].nil?
      end
      redirect_to peer_path(peerage,user.slug)
      if user.peers.count == 1
        user.send_reset_password_instructions
      else
        PeerageMailer.add_to_peerage(user,peerage).deliver
      end
    else
      flash.alert = user.errors.full_messages.to_sentence
      user.vigilant = params[peerage][:vigilant]
      render :new
    end
  end
  def edit
    @peer = Peer.find(params[:id])
    raise "Access Denied" unless @peer.order == peerage
  end
  def update
    @peer = Peer.find(params[:id])
    raise "Access Denied" unless @peer.order == peerage
    user = @peer.user
    if user.update(update_user_params)
      redirect_to chambers_admin_peers_path(peerage)
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(peerage).permit(:id, :sca_name, :email)
  end
  def update_user_params
    params.require(peerage).permit(:deceased)
  end
  def authorize_admin
    authorize! :manage, peerage
  end
  def peerage
    params[:peerage].to_sym
  end
  def self.controller_path
    'chambers/peerage/admin/peers'
  end
end
