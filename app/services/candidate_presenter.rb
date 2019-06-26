class CandidatePresenter
  extend Forwardable
  def_delegators :@candidate, :sca_name, :comments, :profile_pic, :list, :group, :documents, :peerage_type, :id

  def initialize(candidate)
    @candidate = candidate
    @results = @candidate&.poll_results&.last
  end

  def poll_result?
    @results.present?
  end

  def advocates
    @candidate.advocacies.map{ |adv| "<a href=\"/#{adv.peer.peerage_type}/#{adv.peer.slug}\">#{adv.peer.sca_name}</a>" }.join(', ').html_safe
  end

  def advocates?
    @candidate.advocacies.count > 0
  end

  def document_count
    @candidate.documents.count
  end
  def specialties
    array = []
    @candidate.specialties.each do |spec|
      array.push("<a href=\"/chambers/#{spec.peerage_type}/specialties/#{spec.slug}\">#{spec.name}</a>")
    end
    array.push @candidate.specialty_detail if @candidate.specialty_detail.present?
    array.join(', ').html_safe
  end

  #TBRemoved
  def specialties_link
    specialties
  end

  def specialties?
    @candidate.specialty_detail.present? || @candidate.specialties.present?
  end

  def elevate
    @results&.elevate || ''
  end
  def wait
    @results&.wait || ''
  end
  def drop
    @results&.drop || ''
  end
  def no_strong_opinion
    @results&.no_strong_opinion || ''
  end
  def rec
    if @results&.rec
      "#{(@results.rec * 100).round}%" 
    else
      ''
    end
  end
  def fav
    if @results&.fav
      "#{(@results.fav * 100).round}%"
    else
      ''
    end
  end
end
