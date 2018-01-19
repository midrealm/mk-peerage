require 'rails_helper'
describe "get /chambers/laurel/groups" do
  before(:each) do
    @group = create(:group, name: "the Middle", slug: "the_middle")
    @child = create(:group, name: "High Haven", slug: "high_haven", parent_id: @group.id)
    @peer = create(:laurel, sca_name: "Mundugus Jones", group: @group)
    sign_in(@peer)
  end
  it "shows list of groups and link to specific group" do
    candidate = create(:candidate, group: @child, peerage_type: :laurel)
    get "/chambers/laurel/groups"
    expect(response).to have_http_status(:success)
    expect(response.body).to include("/chambers/laurel/groups/high_haven")
  end

  it "renders tree of groups" do
    grand_child = create(:group, name: "Poopland", slug: "poopland", parent: @child)
    create(:candidate, group: grand_child, peerage_type: :laurel)
    get "/chambers/laurel/groups"
    expect(response.body).not_to include("/chambers/laurel/groups/the_middle")
    expect(response.body).to include("/chambers/laurel/groups/high_haven")
    expect(response.body).to include("/chambers/laurel/groups/poopland")
  end
end
