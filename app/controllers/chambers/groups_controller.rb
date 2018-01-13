class Chambers::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_peer
  def index
    @middle_kingdom = Group.find_by(name: 'the Middle')
    @peerage = params[:peerage]

  end
  def show
    @group = Group.find_by(slug: params[:slug])
    @peerage = params[:peerage]

  end
  private

  def authorize_peer
    authorize! :read, params[:peerage]

  end
  def self.controller_path
    'chambers/peerage/groups'
  end
end
