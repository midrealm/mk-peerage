shared_examples_for "get /chambers/PEERAGE/poll" do |peerage,other_peerage|
  describe "get /chambers/#{peerage}/poll" do
    context "logged in #{peerage}" do
      before(:each) do
        @peer = create(peerage)
        sign_in(@peer)
      end
      describe "current poll" do
        before(:each) do
          @poll = create(:current_poll, peerage_type: peerage)
          @candidate1 = create(:candidate, sca_name: "Candidate1", peerage_type: peerage)
          @candidate2 = create(:candidate, sca_name: "Candidate2", peerage_type: peerage)
        end
        it "shows poll" do
          get "/chambers/#{peerage}/poll"
          expect(response).to have_http_status(:success)
          expect(response.body).to include("Poll")
        end
        it "shows list of candidates" do
          get "/chambers/#{peerage}/poll"
          expect(response.body).to include(@candidate1.sca_name)
          expect(response.body).to include(@candidate2.sca_name)
        end
        it "only shows #{peerage} candidates" do
          other_peerage_candidate = create(:candidate, peerage_type: other_peerage, sca_name: "Octavia OtherPeerage")
          get "/chambers/#{peerage}/poll"
          expect(response.body).not_to include(other_peerage_candidate.sca_name)
        end
  
        it "shows OK if advising has been submitted for a given candidate" do
          advising = create(:advising, poll: @poll, candidate: @candidate1, peer: @peer.public_send(peerage.to_s), submitted: true)
          get "/chambers/#{peerage}/poll"
          expect(response.body).to include("glyphicon-ok")
        end
        it "does not shows OK if advising has not been submitted for a given candidate" do
          get "/chambers/#{peerage}/poll"
          expect(response.body).not_to include("glyphicon-ok")
        end
  
        it "show progress bar with percent of candidates complete" do
          advising = create(:advising, poll: @poll, candidate: @candidate1, peer: @peer.public_send(peerage.to_s), submitted: true)
          get "/chambers/#{peerage}/poll"
          expect(response.body).to include("width: 50%")
          expect(response.body).to include("progress-bar")
      
        end
        it "shows how many have poll entries have been submitted" do
          advising = create(:advising, poll: @poll, candidate: @candidate1, peer: @peer.public_send(peerage.to_s), submitted: true)
          get "/chambers/#{peerage}/poll"
          expect(response.body).to include("1/2 Submitted")
        end
      end
      describe "past poll" do
        before(:each) do
          poll = create(:past_poll, peerage_type: peerage)
        end
        it "redirects to chambers" do
          get "/chambers/#{peerage}/poll"
          expect(response).to redirect_to "/chambers"
        end
      end
      describe "future poll" do
        before(:each) do
          poll = create(:future_poll, peerage_type: peerage) 
        end
        it "redirects to chambers" do
          get "/chambers/#{peerage}/poll"
          expect(response).to redirect_to "/chambers"
        end
      end
    end  
    describe "logged in non-#{peerage} royal" do
      before(:each) do
        royal = create(:royal)
        sign_in(royal)
      end
      it "raises AccessDenied Error if user is not admin" do
          poll = create(:current_poll, peerage_type: peerage)
          expect{get "/chambers/#{peerage}/poll"}.to raise_error(CanCan::AccessDenied)
      end
    end
    describe "guest users" do
      it "redirects if not logged in" do
        get "/chambers/#{peerage}/poll"
        expect(response).to have_http_status(:found)
        expect(response.body).to include("redirected")
      end
    end
  end
end
