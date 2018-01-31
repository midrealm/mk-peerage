shared_examples_for "get /chambers/PEERAGE/poll" do |peerage,other_peerage|
  describe "get /chambers/#{peerage}/poll" do
    context "logged in #{peerage}" do
      before(:each) do
        @peer = create("#{peerage}_user".to_sym)
        sign_in(@peer)
      end
      describe "current poll" do
        before(:each) do
          @poll = create(:current_poll, peerage_type: peerage)
          @candidate1 = create(:candidate, sca_name: "Candidate1", peerage_type: peerage)
          @candidate2 = create(:candidate, sca_name: "Candidate2", peerage_type: peerage)
        end
        it "only shows #{peerage} candidates" do
          other_peerage_candidate = create(:candidate, peerage_type: other_peerage, sca_name: "Octavia OtherPeerage")
          get "/chambers/#{peerage}/poll"
          expect(response.body).not_to include(other_peerage_candidate.sca_name)
        end
      end
    end  
  end
end
