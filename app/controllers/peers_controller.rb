class PeersController < ApplicationController
  def show
    @peer = peer_class.joins(:user).find_by(users: {slug: params[:slug]})
    @peerage = peer_class.peerage_type
    
    render template: "peerage/peers/show"
  end

  def index
    @active_peers = peer_class.where(active: true)
    @inactive_peers = peer_class.where(active: false)
    @order_title = "Master and Mistresses of the #{peer_class.peerage_name}"
    render template: "peerage/peers/index"
  end

  def peer_class
    raise "Don't do this"
  end
end
