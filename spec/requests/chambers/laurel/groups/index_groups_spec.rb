require 'rails_helper'
describe 'Get /chambers/groups' do
  it 'shows list of groups and link to specific group' do
    group = create(:group, name: 'the Middle', slug: 'the_middle')
    child = create(:group, name: 'High Haven', slug: 'high_haven', parent_id: group.id)
    laurel = create(:user, sca_name: 'Mundugus Jones', group: group)
    candidate = create(:candidate, group: child)
    sign_in(laurel)
    get '/chambers/laurel/groups'
    expect(response).to have_http_status(:success)
    expect(response.body).to include('/chambers/laurel/groups/high_haven')
  end
  it 'renders tree of groups' do
    group = create(:group, name: 'the Middle', slug: 'the_middle')
    laurel = create(:user, sca_name: 'Mundugus Jones', group: group)
    sign_in(laurel)
    child = create(:group, name: 'The Barrows',slug: 'the_barrows', parent_id: group.id)
    grand_child = create(:group, name: 'Poopland', slug: 'poopland', parent_id: child.id)
    create(:candidate, group: grand_child)
    get '/chambers/laurel/groups'
    expect(response.body).not_to include('/chambers/laurel/groups/the_middle')
    expect(response.body).to include('/chambers/laurel/groups/the_barrows')
    expect(response.body).to include('/chambers/laurel/groups/poopland')
  end
  context "logged in pelican (non-laurel)" do
    before(:each) do
      @pelican = create(:pelican)
      sign_in(@pelican)
    end
    it "shows not authorized error for non-pelican user" do
      expect{get "/chambers/laurel/groups/"}.to raise_error(CanCan::AccessDenied)
    end
  end
end
