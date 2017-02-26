class LaurelsController < ApplicationController
  def show
    name = params[:sca_name].tr("_"," ")
    @laurel = User.find_by(sca_name: name)
  end

  def index
    @active_laurels = User.where(active: true)
    @inactive_laurels = User.where(active: false)
  end
end
