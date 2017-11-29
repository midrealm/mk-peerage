module Chambers
  class Pelican::GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
      authorize! :read, :pelican
      @middle_kingdom = Group.find_by(name: 'the Middle')
      @peerage = 'pelican'
      render template: "chambers/peerage/groups/index"
    end
    def show
      authorize! :read, :pelican
      @group = Group.find_by(slug: params[:slug])
      @peerage = 'pelican'
      render template: "chambers/peerage/groups/show"
    end
  end
end
