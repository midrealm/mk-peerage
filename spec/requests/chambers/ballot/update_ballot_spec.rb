require 'rails_helper'
describe "patch /chambers/laurel/poll/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, peerage_type: :laurel)
  end
  describe "for active poll" do
    before(:each) do
      @poll = create(:current_poll, peerage_type: :laurel)
    end
    describe "for logged in laurel" do
      before(:each) do
        @peer = create(:laurel_peer)
        sign_in(@peer.user)
      end
      it "saves update for given advising" do
        create(:advising, candidate: @candidate, poll: @poll, peer: @peer)
        patch "/chambers/laurel/poll/candidates/#{@candidate.id}", params: { :advising => {comment: 'This is a comment', judgement: :elevate} }
        expect(Advising.last.comment).to include('This is a comment')
        expect(Advising.last.judgement_elevate?).to be_truthy
      end
      it "redirects to poll" do
        create(:advising, candidate: @candidate, poll: @poll, peer: @peer)
        patch "/chambers/laurel/poll/candidates/#{@candidate.id}", params: { :advising => {comment: 'This is a comment', judgement: :elevate} }
        expect(response).to redirect_to "/chambers/laurel/poll"
      end
    end
  
  end
end
