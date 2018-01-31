shared_examples_for "get /chambers/PEERAGE/poll/candidates/:id" do |peerage,other_peerage|
  describe "for active poll for logged in non-#{peerage}" do
    it "raises AccessDenied Error" do
      candidate = create(:candidate, vote: true, peerage_type: peerage)
      poll = create(:current_poll, peerage_type: peerage)
      other_peer = create("#{other_peerage}_user".to_sym)
      sign_in(other_peer)
      expect{get "/chambers/#{peerage}/poll/candidates/#{candidate.id}"}.to raise_error(CanCan::AccessDenied)
    end
  end
end
