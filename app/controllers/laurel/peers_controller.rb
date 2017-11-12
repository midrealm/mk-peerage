class Laurel::PeersController < ApplicationController
  def show
    @peer = Laurel.joins(:user).find_by(users: {slug: params[:slug]})
    @peerage = 'laurel'
    
    render template: "peerage/peers/show"
  end

  def index
    @active_peers = Laurel.where(active: true)
    @inactive_peers = Laurel.where(active: false)
    @order_title = "Master and Mistresses of the Laurel"
    render template: "peerage/peers/index"
  end

end
