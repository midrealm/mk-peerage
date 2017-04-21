require 'rails_helper'
describe 'Get /chambers/groups' do
  it 'shows list of groups and link to specific group' do
    group = create(:group, name: 'the Middle')
    child = create(:group, name: 'High Haven', parent_id: group.id)
    laurel = create(:user, sca_name: 'Mundugus Jones', group: group)
    sign_in(laurel)
    get '/chambers/groups'
    expect(response).to have_http_status(:success)
    expect(response.body).to include('/chambers/groups/High_Haven')
  end
  it 'renders tree of groups' do
    group = create(:group, name: 'the Middle')
    laurel = create(:user, sca_name: 'Mundugus Jones', group: group)
    sign_in(laurel)
    child = create(:group, name: 'The Barrows', parent_id: group.id)
    grand_child = create(:group, name: 'Poopland', parent_id: child.id)
    get '/chambers/groups'
    expect(response.body).not_to include('/chambers/groups/the_Middle')
    expect(response.body).to include('/chambers/groups/The_Barrows')
    expect(response.body).to include('/chambers/groups/Poopland')
  end
end
