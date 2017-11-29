module Chambers
  class Pelican::GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
      @middle_kingdom = Group.find_by(name: 'the Middle')
      @peerage = 'pelican'
      render template: "chambers/peerage/groups/index"
    end
    def show
      @group = Group.find_by(slug: params[:slug])
      @peerage = 'pelican'
      render template: "chambers/peerage/groups/show"
    end
  end
end
