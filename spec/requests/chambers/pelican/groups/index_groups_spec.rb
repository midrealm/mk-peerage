require 'rails_helper'
describe 'Get /chambers/pelican/groups' do
  before(:each) do
    @group = create(:group, name: 'the Middle', slug: 'the_middle')
    @child = create(:group, name: 'High Haven', slug: 'high_haven', parent_id: @group.id)
    @pelican = create(:pelican, sca_name: 'Mundugus Jones', group: @group)
    sign_in(@pelican)
  end
  it 'shows list of groups and link to specific group' do
    candidate = create(:candidate, group: @child, peerage_type: :pelican)
    get '/chambers/pelican/groups'
    expect(response).to have_http_status(:success)
    expect(response.body).to include('/chambers/pelican/groups/high_haven')
  end

  it "doesn't show laurel groups" do
    laurel_group = create(:group, name: 'Laurel Land', slug: 'laureland', parent: @group)  
    laurel = create(:candidate, group: laurel_group, peerage_type: :laurel)
    get '/chambers/pelican/groups'
    expect(response.body).not_to include('/chambers/pelican/groups/laureland')
  end
  it 'renders tree of groups' do
    grand_child = create(:group, name: 'Poopland', slug: 'poopland', parent: @child)
    create(:candidate, group: grand_child, peerage_type: :pelican)
    get '/chambers/pelican/groups'
    expect(response.body).not_to include('/chambers/pelican/groups/the_middle')
    expect(response.body).to include('/chambers/pelican/groups/high_haven')
    expect(response.body).to include('/chambers/pelican/groups/poopland')
  end
  context "logged in laurel (non-pelican)" do
    before(:each) do
      @laurel = create(:user)
      sign_in(@laurel)
    end
    it "shows not authorized error for non-pelican user" do
      expect{get "/chambers/pelican/groups/"}.to raise_error(CanCan::AccessDenied)
    end
  end
end
