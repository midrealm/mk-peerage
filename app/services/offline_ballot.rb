class OfflineBallot
	include ActiveModel::Model
	validates_presence_of :peer_id
	validates_each :vote_list_advisings, :watch_list_advisings do  |record, attr, value|
		value.each do |adv|
			record.errors.add attr, 'every candidate needs judgement' if adv.judgement.blank? 
		end
	end
	
	attr_accessor :vote_list_advisings, :peer_id, :watch_list_advisings
  def initialize(peerage)
    @peerage = peerage 
		@poll = Poll.active_for(@peerage)
		@vote_list_advisings = Candidate.where_order(@peerage).where(vote:true).order(:sca_name).map{ |c| Advising.find_or_initialize_by(candidate: c, poll: @poll, peer_id: @peer_id )}
		@watch_list_advisings = Candidate.where_order(@peerage).where(vote:false).order(:sca_name).map{ |c| Advising.find_or_initialize_by(candidate: c, poll: @poll, peer_id: @peer_id )}
		
  end
  def peers
    Peer.where_order(@peerage).where(active: true).select{ |p| !peer_has_started_poll?(p) }
  end
	def watch_list_advisings_attributes=(attributes)
		attributes.each do |i, adv_params|
			adv_params["peer_id"] = @peer_id
			my_adv = @watch_list_advisings.find{|adv| adv.candidate_id == adv_params["candidate_id"].to_i}
			my_adv.assign_attributes(adv_params)
		end	
	end
	def vote_list_advisings_attributes=(attributes)
		attributes.each do |i, adv_params|
			adv_params["peer_id"] = @peer_id
			my_adv = @vote_list_advisings.find{|adv| adv.candidate_id == adv_params["candidate_id"].to_i}
			my_adv.assign_attributes(adv_params)
		end	
	end
	def judgement_names
		Advising.judgement_abbreviations
	end
	def save
		if valid? && advisings_valid?
		  @vote_list_advisings.each { |adv| adv.submitted = true; adv.save } 
		  @watch_list_advisings.each { |adv| adv.submitted = true; adv.save } 
		else
		  false
		end
	end

  private
  def peer_has_started_poll?(peer)
    Ballot.new(peer).submission_count > 0
  end
	def advisings_valid?
		@vote_list_advisings.all?{ |adv| adv.valid? } && @watch_list_advisings.all? {|adv| adv.valid?}
	end
  
end
