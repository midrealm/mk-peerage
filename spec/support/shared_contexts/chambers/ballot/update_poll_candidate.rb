shared_examples_for "put /chambers/PEERAGE/poll/candidates/:id" do |peerage,other_peerage|
  describe "put /chambers/#{peerage}/poll/candidates/:id" do
    before(:each) do
      @candidate = create(:candidate, peerage_type: peerage)
    end
    describe "for active poll" do
      before(:each) do
        @poll = create(:current_poll, peerage_type: peerage)
      end
      describe "for logged in #{peerage}" do
        before(:each) do
          @peer = create(peerage)
          sign_in(@peer)
        end
        it "saves update for given advising" do
          create(:advising, candidate: @candidate, poll: @poll, peer: @peer.public_send(peerage.to_s))
          put "/chambers/#{peerage}/poll/candidates/#{@candidate.id}", params: { :advising => {comment: 'This is a comment', judgement: :elevate} }
          expect(Advising.last.comment).to include('This is a comment')
          expect(Advising.last.elevate?).to be_truthy
          expect(Advising.last.submitted).to be_truthy
        end
        it "redirects to poll" do
          create(:advising, candidate: @candidate, poll: @poll, peer: @peer.public_send(peerage.to_s))
          put "/chambers/#{peerage}/poll/candidates/#{@candidate.id}", params: { :advising => {comment: 'This is a comment', judgement: :elevate} }
          expect(response).to redirect_to "/chambers/#{peerage}/poll"
        end
      end
    
    end
  end
end
