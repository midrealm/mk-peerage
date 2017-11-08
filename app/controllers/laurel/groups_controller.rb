class Laurel::GroupsController < ApplicationController
  def index
    @kingdoms = Group.roots
  end
  def show
    name = params[:name].tr("_"," ")
    @group = Group.find_by(name: name)
  end
end
