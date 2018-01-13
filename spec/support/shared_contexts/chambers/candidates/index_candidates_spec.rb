shared_examples_for "get /chambers/PEERAGE/candidates" do |peerage,other_peerage|
  describe "get /chambers/#{peerage}/candidates" do
    context "signed in #{peerage}" do
      before(:each) do
        @peer = create(peerage)
        sign_in(@peer)
        @candidate = create(:candidate, peerage_type: peerage)
        
      end
      it "shows list of candidates" do
        get "/chambers/#{peerage}/candidates"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Candidates")
      end
      it "has link to candidate's page" do
        get "/chambers/#{peerage}/candidates"
        expect(response.body).to include("/chambers/#{peerage}/candidates/#{@candidate.id}")
      end
      it "only shows #{peerage} candidates" do
        other_peerage_candidate = create(:candidate, sca_name: "Octavia OtherPeerage", vote: false, peerage_type: other_peerage)
        peerage_candidate = create(:candidate, sca_name: "Peter Peer", vote: true, peerage_type: peerage)
        get "/chambers/#{peerage}/candidates"
        expect(response.body).not_to include("Octavia OtherPeerage")
        expect(response.body).to include("Peter Peer")
      end
      it "shows advocates for given candidate" do
        advocate = create(peerage, sca_name: "Molly Mindingus")
        create(:advocacy, candidate: @candidate, peer: advocate.public_send(peerage.to_s))
        get "/chambers/#{peerage}/candidates"
        expect(response.body).to include("Molly Mindingus")
      end
  
      it "shows results from last poll in table" do
        p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
        p.save(validate: false)
        pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
        
        get "/chambers/#{peerage}/candidates"
        expect(response.body).to include("123456")
      end
  
      it "does not show comments from last poll" do
        p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
        p.save(validate: false)
        pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
        get "/chambers/#{peerage}/candidates"
        expect(response.body).not_to include("Comments from Last Poll")
        expect(response.body).not_to include("candidates/#{@candidate.id}/poll_comments")
      end
    end
  
    it "for logged in royal, shows comments from last poll" do
        @royal = create(:royal)
        sign_in(@royal)
        @candidate = create(:candidate, peerage_type: peerage)
        p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
        p.save(validate: false)
        pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
        get "/chambers/#{peerage}/candidates"
        expect(response.body).to include("Comments from Last Poll")
        expect(response.body).to include("candidates/#{@candidate.id}/poll_comments")
    end
  
    it "for logged in admin, should not show comments from last poll" do
        @admin = create("#{peerage}_admin".to_sym)
        sign_in(@admin)
        @candidate = create(:candidate, peerage_type: peerage)
        p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
        p.save(validate: false)
        pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
        get "/chambers/#{peerage}/candidates"
        expect(response.body).not_to include("Comments from Last Poll")
        expect(response.body).not_to include("candidates/#{@candidate.id}/poll_comments")
    end
    context "logged in #{other_peerage} (non-#{peerage})" do
      before(:each) do
        other_peer = create(other_peerage)
        sign_in(other_peer)
      end
      it "shows not authorized error for non-#{peerage} user" do
        expect{get "/chambers/#{peerage}/candidates/"}.to raise_error(CanCan::AccessDenied)
      end
    end
    it "redirects if not logged in" do
      get "/chambers/#{peerage}/candidates"
      expect(response).to have_http_status(:found)
      expect(response.body).to include("redirected")
    end
  end
end
