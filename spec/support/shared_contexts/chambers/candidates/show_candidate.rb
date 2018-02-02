shared_examples_for "get /chambers/PEERAGE/candidates/:id" do |peerage, other_peerage|
  describe "Get /chambers/#{peerage}/candidates/:id" do
    before(:each) do
      @candidate = create(:candidate, peerage_type: peerage)
    end
    context "logged in #{peerage}" do
      before(:each) do
        @peer = create("#{peerage}_user".to_sym)
        sign_in(@peer)
      end
      it "throws error for showing non-#{peerage} candidate" do
        other_peerage_candidate = create("#{other_peerage}_candidate".to_sym)
        expect{get "/chambers/#{peerage}/candidates/#{other_peerage_candidate.id}"}.to raise_error("Access Denied")
      end
    end
    context "logged in #{other_peerage} (non-#{peerage})" do
      before(:each) do
        other_peer = create("#{other_peerage}_user".to_sym)
        sign_in(other_peer)
      end
      it "shows not authorized error for non-#{peerage} user" do
        expect{get "/chambers/#{peerage}/candidates/#{@candidate.id}"}.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
