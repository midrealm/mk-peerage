class Chambers::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_peer
  def index
    @middle_kingdom = Group.find_by(name: 'the Middle')
    @peerage = peerage_type
  end
  def show
    @group = Group.find_by(slug: params[:slug])
    @peerage = peerage_type
  end
  private
  def peerage_type
  end
  def authorize_peer
    authorize! :read, peerage_type
  end
  def self.controller_path
    'chambers/peerage/groups'
  end
end
