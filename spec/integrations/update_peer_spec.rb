require 'rails_helper'

RSpec.feature 'Update Peer info' do
  include_context 'when signed in through capybara'
  scenario 'updates peer info' do
    peer = create(:user, sca_name: 'Fake Name')
    sign_in(peer)
    visit '/users/edit' 
    fill_in 'user_sca_name', with: 'Smarty Pants'
    fill_in 'user_specialty_detail', with: 'Earwax Studies'
    click_on 'submit'
    
    expect(User.last.sca_name).to eq('Smarty Pants')
    expect(User.last.specialty_detail).to eq('Earwax Studies')
  end
end
