class Advising < ApplicationRecord
  belongs_to :peer
  belongs_to :candidate
  belongs_to :poll
  
  enum judgement: [:elevate, :wait, :no_strong_opinion, :drop]
  
  def self.vote_list_judgements
    Hash[Advising.judgements.keys.map{|j| [Advising.vote_list_judgement_name(j),j]}]     
  end
  def self.vote_list_judgement_name(judgement)
    case judgement
    when 'elevate'
      'Elevate to Peerage'
    when 'wait'
      'Wait'
    when 'no_strong_opinion'
      'No Strong Opinion'
    when 'drop'
      'Drop to Watch List'
    end
  end

  def self.watch_list_judgements
    Hash[Advising.judgements.keys.map{|j| [Advising.watch_list_judgement_name(j),j]}]
  end
  def self.watch_list_judgement_name(judgement)
    case judgement
    when 'elevate'
      'Elevate to Vote List'
    when 'wait'
      'Wait'
    when 'no_strong_opinion'
      'No Strong Opinion'
    when 'drop'
      'Drop from Watch List'
    end
  end

  def judgement_name
    if candidate.vote?
      self.class.vote_list_judgement_name(judgement)
    else
      self.class.watch_list_judgement_name(judgement)
    end
  end
  
end
