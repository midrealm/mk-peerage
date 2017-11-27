class Pelican::PeersController < ApplicationController
  def show
    @peer = Pelican.joins(:user).find_by(users: {slug: params[:slug]})
    @peerage = 'pelican'
    
    render template: "peerage/peers/show"
  end

  def index
    @active_peers = Pelican.where(active: true)
    @inactive_peers = Pelican.where(active: false)
    @order_title = "Master and Mistresses of the Pelican"
    render template: "peerage/peers/index"
  end

end
