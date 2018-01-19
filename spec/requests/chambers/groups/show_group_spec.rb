require 'rails_helper'
describe "get /chambers/PEERAGE/groups/:slug" do
  it "shows list of groups and link to specific group" do
    group = create(:group, name: "High Haven", slug: "high_haven")
    peer = create(:laurel, group: group)
    sign_in(peer)
    candidate = create(:candidate, group: group, sca_name: "Dingus McDoooooogle", peerage_type: :laurel)
    get "/chambers/laurel/groups/high_haven"
    expect(response).to have_http_status(:success)
    expect(response.body).to include(candidate.sca_name)
  end
  it "shows list of child groups" do
    peer = create(:laurel)
    sign_in(peer)
    group = create(:group, name: "High Haven", slug: "high_haven")
    child = create(:group, name: "The Barrows", slug: "the_barrows", parent_id: group.id)
    grand_child = create(:group, name: "Poopland", slug: "poopland", parent_id: child.id)
    create(:candidate, group: grand_child, peerage_type: :laurel)
    get "/chambers/laurel/groups/High_Haven"
    expect(response.body).not_to include("/chambers/laurel/groups/high_haven")
    expect(response.body).to include("chambers/laurel/groups/the_barrows")
    expect(response.body).to include("chambers/laurel/groups/poopland")
  end
end
