class Laurel::GroupsController < ApplicationController
  def index
    @kingdoms = Group.roots
  end
  def show
    @group = Group.find_by(slug: params[:slug])
  end
end
