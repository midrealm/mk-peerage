require 'rails_helper'
describe 'Get /laurel/groups' do
  it 'shows list of groups and link to specific group' do
    group = create(:group, name: 'High Haven', slug: 'high_haven')
    laurel = create(:user, group: group)
    get '/laurel/groups'
    expect(response).to have_http_status(:success)
    expect(response.body).to include('/groups/high_haven')
  end
  it 'renders tree of groups' do
    group = create(:group, name: 'High Haven', slug: 'high_haven')
    child = create(:group, name: 'The Barrows', slug: 'the_barrows', parent_id: group.id)
    grand_child = create(:group, name: 'Poopland', slug: 'poopland', parent_id: child.id)
    laurel = create(:user, group: grand_child)
    get '/laurel/groups'
    expect(response.body).to include('/groups/high_haven')
    expect(response.body).to include('/groups/the_barrows')
    expect(response.body).to include('/groups/poopland')
  end
end
