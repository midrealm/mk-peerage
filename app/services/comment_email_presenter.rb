class CommentEmailPresenter
  
  def initialize(user, candidate, comment_text)
    @user = user
    @candidate = candidate
    @comment_text = comment_text
    @peer = user.peer(peerage_type)
  end

  def peerage_type
    @candidate.peerage_type
  end

  def peer_sca_name
    out = ''
    out = " (#{@peer.specialties_sentence})" if @peer.specialties?
    "#{@user.sca_name}#{out}" 
  end
  def candidate_sca_name_with_specialties
    out = ''
    out = " (#{@candidate.specialties_sentence})" if @candidate.specialties?
    "#{@candidate.sca_name}#{out}" 
  end
  def candidate_sca_name
    @candidate.sca_name
  end
  def comment_text
    @comment_text
  end
  def candidate_id
    @candidate.id
  end
  def peer_slug
    @peer.slug
  end
end
