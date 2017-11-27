class Pelican::GroupsController < ApplicationController
  def index
    @kingdoms = Group.roots
    @peerage = 'pelican'
    render template: "peerage/groups/index"
  end
  def show
    @group = Group.find_by(slug: params[:slug])
    @peerage = 'pelican'
    render template: "peerage/groups/show"
  end
end
