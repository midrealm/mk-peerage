require 'rails_helper'
describe 'Get /chambers/groups/High_Haven' do
  it 'shows list of groups and link to specific group' do
    group = create(:group, name: 'High Haven', slug: 'high_haven')
    pelican = create(:pelican, group: group)
    sign_in(pelican)
    candidate = create(:candidate, group: group, sca_name: 'Dingus McDoooooogle', peerage_type: :pelican)
    get '/chambers/pelican/groups/high_haven'
    expect(response).to have_http_status(:success)
    expect(response.body).to include(candidate.sca_name)
  end
  it 'shows list of child groups' do
    pelican = create(:pelican)
    sign_in(pelican)
    group = create(:group, name: 'High Haven', slug: 'high_haven')
    child = create(:group, name: 'The Barrows', slug: 'the_barrows', parent_id: group.id)
    grand_child = create(:group, name: 'Poopland', slug: 'poopland', parent_id: child.id)
    create(:candidate, group: grand_child, peerage_type: :pelican)
    get '/chambers/pelican/groups/High_Haven'
    expect(response.body).not_to include('/chambers/pelican/groups/high_haven')
    expect(response.body).to include('chambers/pelican/groups/the_barrows')
    expect(response.body).to include('chambers/pelican/groups/poopland')
  end
end
