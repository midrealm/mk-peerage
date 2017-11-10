module Chambers
  class Laurel::GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
      @middle_kingdom = Group.find_by(name: 'the Middle')
      @peerage = 'laurel'
      render template: "chambers/peerages/groups/index"
    end
    def show
      @group = Group.find_by(slug: params[:slug])
      @peerage = 'laurel'
      render template: "chambers/peerages/groups/show"
    end
  end
end
