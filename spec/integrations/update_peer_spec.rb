require 'rails_helper'

RSpec.feature 'Update Peer info' do
  include_context 'when signed in through capybara'
  scenario 'updates peer info' do
    peer = create(:user, sca_name: 'Fake Name')
    sign_in(peer)
    expect(User.last.vigilant).to eq(false)
    expect(User.last.active).to eq(true)
    visit '/users/edit' 
    fill_in 'user_sca_name', with: 'Smarty Pants'
    fill_in 'user_peer_attributes_specialty_detail', with: 'Earwax Studies'
    fill_in 'user_peer_attributes_elevated_by', with: 'Some People'
    fill_in 'user_peer_attributes_bio', with: 'Some Text'
    fill_in 'user_peer_attributes_apprenticed_to', with: 'Some Person'
    uncheck 'user_peer_attributes_active'
    check 'user_peer_attributes_vigilant'
    click_on 'submit'
    
    expect(User.last.sca_name).to eq('Smarty Pants')
    expect(User.last.specialty_detail).to eq('Earwax Studies')
    expect(User.last.bio).to eq('Some Text')
    expect(User.last.peer.elevated_by).to eq('Some People')
    expect(User.last.vigilant).to eq(true)
    expect(User.last.active).to eq(false)
    expect(User.last.apprenticed_to).to eq('Some Person')
  end
end
