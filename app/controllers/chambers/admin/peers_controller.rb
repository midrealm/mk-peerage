class Chambers::Admin::PeersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def new()
    @peer = UserAdder.new(peerage: peerage)
  end
  def index
    @users = Peer.where_order(peerage)
  end
  def create
    adder = UserAdder.new(**user_params)
    success = adder.add
    user = adder.user
    if success
      redirect_to peer_path(peerage,user.slug)
      adder.send_email
    else
      flash.alert = user.errors.full_messages.to_sentence
      @peer = adder
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

  def reset_password
    @peers = Peer.where_order(peerage)
  end
  private
  def user_params
    params.require(peerage).permit(:id, :sca_name, :email, :vigilant).merge(peerage: peerage).to_hash.symbolize_keys
  end
  def update_user_params
    params.require(peerage).permit(:deceased)
  end
  def authorize_admin
    authorize! :manage, peerage
  end
  def self.controller_path
    'chambers/peerage/admin/peers'
  end
end
