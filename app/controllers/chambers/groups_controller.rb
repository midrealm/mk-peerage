class Chambers::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_peer

  def index
    @middle_kingdom = Group.find_by(name: 'the Middle')
  end

  def show
    @group = Group.find_by(slug: params[:slug])
  end
  private

  def authorize_peer
    @peerage = params[:peerage]
    authorize! :read, @peerage.to_sym
  end

  def self.controller_path
    'chambers/peerage/groups'
  end
end
