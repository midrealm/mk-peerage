class GroupsController < ApplicationController
  def index
    @kingdoms = Group.where(parent_id:nil)
  end
  def show
    name = params[:name].tr("_"," ")
    @group = Group.find_by(name: name)
  end
end
