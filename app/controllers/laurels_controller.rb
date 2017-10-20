class LaurelsController < ApplicationController
  def show
    @laurel = User.find_by(slug: params[:slug])
  end

  def index
    @active_laurels = Peer.where(active: true)
    @inactive_laurels = Peer.where(active: false)
  end

end
