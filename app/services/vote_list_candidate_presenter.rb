class VoteListCandidatePresenter < CandidatePresenter
  def status
    "Vote List"
  end
  def index_tr_class
    'vote-tr'
  end
  def show_box_class
    'vote-show-box'
  end
  def show_status_class
    'vote-show-status'
  end
end
