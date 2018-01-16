shared_examples_for "get /chambers/PEERAGE/groups/:slug" do |peerage,other_peerage|
  describe "get /chambers/PEERAGE/groups/:slug" do
    it "shows list of groups and link to specific group" do
      group = create(:group, name: "High Haven", slug: "high_haven")
      peer = create(peerage, group: group)
      sign_in(peer)
      candidate = create(:candidate, group: group, sca_name: "Dingus McDoooooogle", peerage_type: peerage)
      get "/chambers/#{peerage}/groups/high_haven"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(candidate.sca_name)
    end
    it "shows list of child groups" do
      peer = create(peerage)
      sign_in(peer)
      group = create(:group, name: "High Haven", slug: "high_haven")
      child = create(:group, name: "The Barrows", slug: "the_barrows", parent_id: group.id)
      grand_child = create(:group, name: "Poopland", slug: "poopland", parent_id: child.id)
      create(:candidate, group: grand_child, peerage_type: peerage)
      get "/chambers/#{peerage}/groups/High_Haven"
      expect(response.body).not_to include("/chambers/#{peerage}/groups/high_haven")
      expect(response.body).to include("chambers/#{peerage}/groups/the_barrows")
      expect(response.body).to include("chambers/#{peerage}/groups/poopland")
    end
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