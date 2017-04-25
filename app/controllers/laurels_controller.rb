class LaurelsController < ApplicationController
  def show
    @laurel = User.find_by(slug: params[:slug])
  end

  def index
    @active_laurels = User.where(active: true)
    @inactive_laurels = User.where(active: false)
  end
end
