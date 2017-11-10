module Chambers
  class GroupsController < ApplicationController
    before_action :authenticate_user!
    def index
      @middle_kingdom = Group.find_by(name: 'the Middle')
    end
    def show
      @group = Group.find_by(slug: params[:slug])
    end
  end
end
