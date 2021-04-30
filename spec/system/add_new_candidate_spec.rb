require 'rails_helper'

RSpec.describe 'Add New Candidate' do
  include_context 'when signed in through capybara'
  it 'adds new candidate when appropriate info is filled in' do
    expect(Candidate.count).to eq(0)
    admin = create(:admin)
    sign_in(admin)
    g = create(:group)
    create(:group, parent_id: g.id)
    visit '/chambers/laurel/admin/candidates/new' 
    fill_in 'candidate_sca_name', with: 'Smarty Pants'
    all('#candidate_group_id option')[1].select_option
    attach_file 'profile_pic_input', Rails.root + 'spec/fixtures/images/portrait.jpg'
    click_on 'crop_button'
    click_on 'Create Candidate'
    
    expect(Candidate.count).to eq(1)
    expect(Candidate.last.sca_name).to eq('Smarty Pants')
    expect(Candidate.last.profile_pic.attached?).to be_truthy
  end
end
