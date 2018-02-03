class Chambers::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_peer
  helper_method :peerage

  def index
    @middle_kingdom = Group.find_by(name: 'the Middle')
  end

  def show
    @group = Group.find_by(slug: params[:slug])
  end
  private

  def authorize_peer
    authorize! :read, peerage
  end

  def self.controller_path
    'chambers/peerage/groups'
  end
end
