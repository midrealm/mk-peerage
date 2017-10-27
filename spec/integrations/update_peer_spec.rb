require 'rails_helper'

RSpec.feature 'Update Peer info' do
  include_context 'when signed in through capybara'
  scenario 'updates peer info' do
    superior = create(:user, sca_name: 'My Laurel')
    peer = create(:user, sca_name: 'Fake Name')
    specialty1 = create(:specialty, name: 'Generic Specialty')
    specialty2 = create(:specialty, name: 'Other Specialty')
    sign_in(peer)
    expect(Peer.last.sca_name).to eq('Fake Name')
    expect(Peer.last.vigilant).to eq(false)
    expect(Peer.last.active).to eq(true)
    expect(Peer.count).to eq(2)
    visit '/users/edit' 
    select 'Generic Specialty', from: 'Specialties'
    select 'Other Specialty', from: 'Specialties'
    fill_in 'user_sca_name', with: 'Smarty Pants'
    fill_in 'user_peer_attributes_specialty_detail', with: 'Earwax Studies'
    fill_in 'user_peer_attributes_elevated_by', with: 'Some People'
    fill_in 'user_peer_attributes_bio', with: 'Some Text'
    select 'My Laurel', from: 'Apprenticed To'
    fill_in 'user_peer_attributes_apprenticed_to', with: 'Some Person'
    uncheck 'user_peer_attributes_active'
    check 'user_peer_attributes_vigilant'
    click_on 'submit'
    
    expect(User.last.sca_name).to eq('Smarty Pants')
    expect(Laurel.last.specialty_detail).to eq('Earwax Studies')
    expect(Laurel.last.bio).to eq('Some Text')
    expect(Laurel.last.elevated_by).to eq('Some People')
    expect(Laurel.last.vigilant).to eq(true)
    expect(Laurel.last.active).to eq(false)
    expect(Laurel.last.apprenticed_to).to eq('Some Person')
    expect(Peer.count).to eq(2)
    specialties = Laurel.last.specialties.pluck(:name)
    expect(specialties).to include('Generic Specialty')
    expect(specialties).to include('Other Specialty')
    expect(Laurel.last.superiors.joins(:user).pluck(:sca_name)).to include('My Laurel')
  end
end
