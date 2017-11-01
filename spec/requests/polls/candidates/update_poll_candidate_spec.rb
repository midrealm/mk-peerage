require 'rails_helper'
describe "put /chambers/poll/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate)
    @judgement = create(:judgement)
  end
  describe "for active poll" do
    before(:each) do
      @poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
      @poll.save(validate: false)
    end
    describe "for logged in laurel" do
      before(:each) do
        @laurel = create(:user)
        sign_in(@laurel)
      end
      it "saves update for given advising" do
        create(:advising, candidate: @candidate, poll: @poll, peer: @laurel.peer)
        put "/chambers/poll/candidates/#{@candidate.id}", params: { :advising => {comment: 'This is a comment', judgement_id: @judgement.id} }
        expect(Advising.first.comment).to include('This is a comment')
        expect(Advising.first.submitted).to be_truthy
      end
      it "redirects to poll" do
        create(:advising, candidate: @candidate, poll: @poll, peer: @laurel.peer)
        put "/chambers/poll/candidates/#{@candidate.id}", params: { :advising => {comment: 'This is a comment', judgement_id: @judgement.id} }
        expect(response).to redirect_to "/chambers/laurel/poll"
      end
    end
  
  end
end
