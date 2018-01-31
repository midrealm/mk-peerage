class Chambers::SpecialtiesController < SpecialtiesController
  before_action :authenticate_user!
  before_action :authorize_peer

  private
  def authorize_peer
    authorize! :read, peerage
  end

  def self.controller_path
    'chambers/peerage/specialties'
  end
end
