class ResultsCalculator
  def initialize(poll)
    raise ArgumentError.new("Calculations forbidden for ongoing polls") if poll.active?
    raise ArgumentError.new("Calculations forbidden for future polls") if poll.future?
    @poll = poll
      
  end
  def calculate
    peerage = @poll.peerage_type
    Candidate.where_order(peerage).each do |cand|
      advisings = Advising.where(poll: @poll, candidate: cand)
      unless advisings.empty?
        pr = PollResult.where(poll: @poll, candidate: cand).first_or_create
        pr.elevate = advisings.where(judgement: :elevate).count
        pr.drop = advisings.where(judgement: :drop).count
        pr.no_strong_opinion = advisings.where(judgement: :no_strong_opinion).count
        pr.wait = advisings.where(judgement: :wait).count
        pr.rec = (pr.elevate + pr.drop + pr.wait)/advisings.count
        pr.fav = (pr.elevate - pr.drop)/advisings.count
        pr.save
      end
    end
  end
end
