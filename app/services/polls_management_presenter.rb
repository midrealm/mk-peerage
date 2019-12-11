## Next Step: Work on Checking for Future Polls
class PollsManagementPresenter
  def initialize(polls)
    @polls = polls.map { |poll| PollManagementPresenter.new(poll) }
  end

  def future
    @polls.find { |p| p.future? }
  end

  def future?
    @polls.any? { |p| p.future? }
  end

  def active?
    @polls.any? { |p| p.active? }
  end

  def active
    @polls.find { |p| p.active? }
  end

  def past
    @polls.select{ |p| p.past? }
  end
end

class PollManagementPresenter
  extend Forwardable
  def_delegators :@poll, :id, :active?, :future?, :past?
  def initialize(poll)
    @poll = poll
  end
  def duration
    "#{start_date} - #{end_date}"
  end 
  def start_date
    date(@poll.start_date)
  end
  def end_date
    date(@poll.end_date)
  end
  
  def published_status
    yes_no(@poll.published?)
  end
  def publish_button_text
    if @poll.published?
      "Unpublish"
    else
      "Publish"
    end
  end

  def calculation_status
    yes_no(PollResult.where(poll: @poll).any?)
  end
  
  private
  def date(date)
   date.strftime("%b %d, %Y") 
  end

  def yes_no(bool)
    if bool
      "<i class=\"fas fa-check\"></i> Yes".html_safe
    else
      "<i class=\"far fa-square\"></i> No".html_safe
    end
  end
end
