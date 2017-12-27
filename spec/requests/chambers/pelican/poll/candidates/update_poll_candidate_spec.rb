require 'rails_helper'
describe "put /chambers/pelican/poll/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, peerage_type: :pelican)
  end
  describe "for active poll" do
    before(:each) do
      @poll = create(:current_poll, peerage_type: :pelican)
    end
    describe "for logged in pelican" do
      before(:each) do
        @pelican = create(:pelican)
        sign_in(@pelican)
      end
      it "saves update for given advising" do
        create(:advising, candidate: @candidate, poll: @poll, peer: @pelican.pelican)
        put "/chambers/pelican/poll/candidates/#{@candidate.id}", params: { :advising => {comment: 'This is a comment', judgement: 'elevate'} }
        expect(Advising.last.comment).to include('This is a comment')
        expect(Advising.last.elevate?).to be_truthy
        expect(Advising.last.submitted).to be_truthy
      end
      it "redirects to poll" do
        create(:advising, candidate: @candidate, poll: @poll, peer: @pelican.pelican)
        put "/chambers/pelican/poll/candidates/#{@candidate.id}", params: { :advising => {comment: 'This is a comment', judgement: 'elevate'} }
        expect(response).to redirect_to "/chambers/pelican/poll"
      end
    end
  
  end
end
