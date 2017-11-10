class Laurel::GroupsController < ApplicationController
  def index
    @kingdoms = Group.roots
    @peerage = 'laurel'
    render template: "peerage/groups/index"
  end
  def show
    @group = Group.find_by(slug: params[:slug])
    @peerage = 'laurel'
    render template: "peerage/groups/show"
  end
end
