require 'rails_helper'

RSpec.feature 'Add New Candidate' do
  include_context 'when signed in through capybara'
  scenario 'adds new candidate when appropriate info is filled in', js: true do
    expect(Candidate.count).to eq(0)
    laurel = create(:user, role: :admin)
    sign_in(laurel)
    visit '/chambers/admin/add_new_candidate' 
    fill_in 'candidate_sca_name', with: 'Smarty Pants'
    attach_file 'profile_pic', Rails.root + 'spec/fixtures/images/portrait.jpg'
    click_on 'crop'
    click_on 'Create Candidate'

    expect(Candidate.count).to eq(1)
    expect(Candidate.last.sca_name).to eq('Smarty Pants')
    expect(Candidate.last.profile_pic_file_size).not_to be_nil
  end
end
