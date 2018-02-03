class PeersController < ApplicationController
  helper_method :peerage
  def show
    @peer = Peer.where_order(peerage).joins(:user).find_by(users: {slug: params[:slug]})
    
    render template: "peerage/peers/show"
  end

  def index
    @active_peers = Peer.where_order(peerage).where(active: true)
    @inactive_peers = Peer.where_order(peerage).where(active: false)
    @order_title = "Master and Mistresses of the #{peerage.capitalize}"
    render template: "peerage/peers/index"
  end
end
