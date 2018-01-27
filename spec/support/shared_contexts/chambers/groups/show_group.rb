shared_examples_for "get /chambers/PEERAGE/groups/:slug" do |peerage,other_peerage|
  describe "get /chambers/PEERAGE/groups/:slug" do
    context "logged in #{other_peerage} (non-#{peerage})" do
      before(:each) do
        other_peer = create(other_peerage)
        sign_in(other_peer)
      end
      it "shows not authorized error for non-#{peerage} user" do
        group = create(:group, name: "High Haven", slug: "high_haven")
        candidate = create(:candidate, group: group, sca_name: "Dingus McDoooooogle", peerage_type: peerage)
        expect{get "/chambers/#{peerage}/groups/high_haven"}.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
