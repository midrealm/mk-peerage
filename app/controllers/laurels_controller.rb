class LaurelsController < ApplicationController
  def show
    @laurel = User.find_by(slug: params[:slug])
  end

  def index
    @active_laurels = User.where("active = ? AND laurel = ?", true, true)
    @inactive_laurels = User.where("active = ? AND laurel = ?", false, true)
  end

end
