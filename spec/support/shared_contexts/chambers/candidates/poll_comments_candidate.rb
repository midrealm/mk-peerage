shared_examples_for "get /chambers/PEERAGE/candidates/:id/poll_comments" do |peerage, other_peerage|
  describe "get /chambers/#{peerage}/candidates/:id/poll_comments" do
    before(:each) do
      @candidate = create(:candidate, vote: true, peerage_type: peerage)
    end
    context 'logged in royal' do
      before(:each) do
        @royal = create(:royal)
        sign_in(@royal)
      end
      context 'past poll result' do
        before(:each) do
          @peer = create(peerage)
          @p = build(:past_poll)
          @pr = create(:poll_result, candidate: @candidate, poll: @p, wait: 1)
          @advising = create(:advising, poll: @p, peer: @peer.public_send(peerage.to_s), candidate: @candidate,
            comment: 'I like this candidate, but not ready yet', submitted: true, 
            judgement: :elevate)
        end
        it "shows poll comment page for candidate with poll result" do
          get "/chambers/#{peerage}/candidates/#{@candidate.id}/poll_comments"
          expect(response).to have_http_status(:success)
          expect(response.body).to include('Full Poll Results')
          expect(response.body).to include(@candidate.sca_name)
        end
        it "shows comments and judgements from submitted results" do
          get "/chambers/#{peerage}/candidates/#{@candidate.id}/poll_comments"
          expect(response.body).to include(@peer.sca_name)
          expect(response.body).to include(@advising.comment)
          expect(response.body).to include(@advising.judgement_name)
        end
      end
      context 'no past poll result' do
        it "redirects to candidates index" do
          get "/chambers/#{peerage}/candidates/#{@candidate.id}/poll_comments"
          expect(response).to redirect_to "/chambers/#{peerage}/candidates"
        end
      end
    end
    it "raises AccessDenied Error for non-royal #{peerage}" do
      @peer = create(peerage)
      sign_in(@peer)
      expect{get "/chambers/#{peerage}/candidates/#{@candidate.id}/poll_comments"}.to raise_error(CanCan::AccessDenied)
    end
    it "raises AccessDenied Error for non-royal admin #{peerage}" do
      @non_royal_admin = create("#{peerage}_admin".to_sym)
      sign_in(@non_royal_admin)
      expect{get "/chambers/#{peerage}/candidates/#{@candidate.id}/poll_comments"}.to raise_error(CanCan::AccessDenied)
    end
    it "redirects if not logged in" do
      get "/chambers/#{peerage}/candidates/#{@candidate.id}/poll_comments"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
