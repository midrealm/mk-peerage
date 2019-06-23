include Rails.application.routes.url_helpers 
include ActionView::Helpers::UrlHelper
class CandidatePresenter
  extend Forwardable
  def_delegators :@candidate, :sca_name, :comments, :profile_pic, :list, :group, :documents

  def initialize(candidate)
    @candidate = candidate
    @results = @candidate&.poll_results&.last
  end

  def advocates
    @candidate.advocacies
  end

  def specialties
    array = []
    @candidate.specialties.each do |spec|
      array.push(link_to( spec.name, chambers_specialty_path(spec.peerage_type,spec.slug)))
    end
    array.push @candidate.specialty_detail
    array
  end

  def elevate
    @results&.elevate
  end
  def wait
    @results&.wait
  end
  def drop
    @results&.drop
  end
  def no_strong_opinion
    @results&.no_strong_opinion
  end
  def rec
    "#{@results.rec * 100}%" if @results&.rec
  end
  def fav
    "#{@results.fav * 100}%" if @results&.fav
  end
end
