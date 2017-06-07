require 'rails_helper'
describe 'Get /groups' do
  it 'shows list of groups and link to specific group' do
    group = create(:group, name: 'High Haven')
    laurel = create(:user, group: group)
    get '/groups'
    expect(response).to have_http_status(:success)
    expect(response.body).to include('/groups/High_Haven')
  end
  it 'renders tree of groups' do
    group = create(:group, name: 'High Haven')
    child = create(:group, name: 'The Barrows', parent_id: group.id)
    grand_child = create(:group, name: 'Poopland', parent_id: child.id)
    laurel = create(:user, group: grand_child)
    get '/groups'
    expect(response.body).to include('/groups/High_Haven')
    expect(response.body).to include('/groups/The_Barrows')
    expect(response.body).to include('/groups/Poopland')
  end
end
