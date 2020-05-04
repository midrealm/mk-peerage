class PeersController < ApplicationController
  def show
    peer = Peer.where_order(peerage).joins(:user).find_by(users: {slug: params[:slug]})
    @peer = PeerPresenter.new(peer)
    
    render template: "peerage/peers/show"
  end

  def index
    @honor_roll = HonorRollPresenter.for(peerage)
    render template: "peerage/peers/index"
  end
end
