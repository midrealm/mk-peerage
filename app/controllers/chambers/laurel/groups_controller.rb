module Chambers
  class Laurel::GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
      authorize! :read, :laurel
      @middle_kingdom = Group.find_by(name: 'the Middle')
      @peerage = 'laurel'
      render template: "chambers/peerage/groups/index"
    end
    def show
      authorize! :read, :laurel
      @group = Group.find_by(slug: params[:slug])
      @peerage = 'laurel'
      render template: "chambers/peerage/groups/show"
    end
  end
end
