class SpecialtiesController < ApplicationController
  def index
    @specialties = Specialty.where(peerage_type: peerage).map{|x| x.ancestors? ? ["#{x.parent.name} #{x.name}",x] : [x.name, x]}.sort.map{|x| x[1] }
  end
  def show
    @specialty = Specialty.find_by(peerage_type: peerage, slug: params[:slug])
  end
  def self.controller_path
    'peerage/specialties'
  end
end
