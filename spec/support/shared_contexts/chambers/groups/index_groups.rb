shared_examples_for "get /chambers/PEERAGE/groups" do |peerage,other_peerage|
  describe "get /chambers/#{peerage}/groups" do
    before(:each) do
      @group = create(:group, name: "the Middle", slug: "the_middle")
      @child = create(:group, name: "High Haven", slug: "high_haven", parent_id: @group.id)
      @peer = create(peerage, sca_name: "Mundugus Jones", group: @group)
      sign_in(@peer)
    end
    it "shows list of groups and link to specific group" do
      candidate = create(:candidate, group: @child, peerage_type: peerage)
      get "/chambers/#{peerage}/groups"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("/chambers/#{peerage}/groups/high_haven")
    end
  
    it "doesn't show #{other_peerage} groups" do
      other_peerage_group = create(:group, name: "Other Peerage Land", slug: "otherpeerageland", parent: @group)  
      create(:candidate, group: other_peerage_group, peerage_type: other_peerage)
      get "/chambers/#{peerage}/groups"
      expect(response.body).not_to include("/chambers/#{peerage}/groups/otherpeerageland")
    end
    it "renders tree of groups" do
      grand_child = create(:group, name: "Poopland", slug: "poopland", parent: @child)
      create(:candidate, group: grand_child, peerage_type: peerage)
      get "/chambers/#{peerage}/groups"
      expect(response.body).not_to include("/chambers/#{peerage}/groups/the_middle")
      expect(response.body).to include("/chambers/#{peerage}/groups/high_haven")
      expect(response.body).to include("/chambers/#{peerage}/groups/poopland")
    end
    context "logged in #{other_peerage} (non-#{peerage})" do
      before(:each) do
        other_peer = create(other_peerage)
        sign_in(other_peer)
      end
      it "shows not authorized error for non-#{peerage} user" do
        expect{get "/chambers/#{peerage}/groups/"}.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
