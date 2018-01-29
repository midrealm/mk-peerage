class SpecialtiesController < ApplicationController
  helper_method :peerage
  def index
    @specialties = Specialty.where(peerage_type: peerage)
  end
  def show
    @specialty = Specialty.find_by(peerage_type: peerage, slug: params[:slug])
  end
  def peerage
    params[:peerage]
  end
  def self.controller_path
    'peerage/specialties'
  end
end
