class Chambers::SpecialtiesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_peer
  helper_method :peerage

  def index
    @specialties = Specialty.where(peerage_type: peerage)  
  end

  def show
    @specialty = Specialty.find_by(peerage_type: peerage, slug: params[:slug])
  end

  private
  def authorize_peer
    authorize! :read, peerage
  end

  def peerage
    params[:peerage].to_sym
  end
  def self.controller_path
    'chambers/peerage/specialties'
  end
end
