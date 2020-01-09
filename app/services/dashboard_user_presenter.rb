class DashboardUserPresenter
  extend Forwardable
  def_delegators :@user

  def initialize(user)
    @user = user
  end

  def peers
    @user.peers.map{|p| DashboardPeerPresenter.new(p)}
  end
end

class DashboardPeerPresenter
  extend Forwardable
  def_delegators :@peer, :order, :peerage_name, :slug

  def initialize(peer)
    @peer = peer
  end

  def poll
    Poll.current(@peer.order)
  end

  def poll?
    poll.present?
  end

  def ballot
    DashboardBallotPresenter.new(Ballot.find_or_initialize_by(poll: poll, peer: @peer)) if poll?
  end 
end

class DashboardBallotPresenter
  def initialize(ballot)
    @ballot = ballot
  end

  def action
    if @ballot.complete?
      'Edit Poll'
    else
      'Take Poll'
    end
  end

  def status
    if @ballot.complete?
      'Finished!'
    else
      "#{@ballot.submission_count}/#{@ballot.candidates.count} Submitted"
    end
  end

  def end_date
    @ballot.poll.end_date.strftime('%d-%b-%Y')
  end
end
