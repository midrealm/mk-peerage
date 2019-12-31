class CandidatePresenter
  extend Forwardable
  def_delegators :@candidate, :sca_name, :comments, :profile_pic, :profile_pic_full, :profile_pic_thumb, :list, :group, :documents, :peerage_type, :id

  def initialize(candidate)
    @candidate = candidate
    @results = @candidate.last_published_poll_result
  end

  def poll_result?
    @results.present?
  end

  def poll_date
		if poll_result?
      poll = @results.poll
      "#{date(poll.start_date)} - #{date(poll.end_date)}"
		else
			''
		end
  end

  def status
    if @candidate.vote?
      'Vote List'
    else
      'Watch List'
    end 
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
  def comments
    @candidate.comments.sort_by(&:created_at)
  end

  def specialties
    array = []
    @candidate.specialties.all.each do |spec|
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
    @candidate.specialty_detail.present? || @candidate.specialties.all.present?
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

  def date(date)
   date.strftime("%b %d, %Y") 
  end
end
