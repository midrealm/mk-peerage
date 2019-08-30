require 'rails_helper'

RSpec.feature 'Update Candidate info' do
  include_context 'when signed in through capybara'
  scenario 'updates candidate info' do
		image = "data:image/gif;base64,R0lGODlhAQABAIAAAAUEBAAAACwAAAAAAQABAAACAkQBADs="

    admin = create(:laurel_admin, sca_name: 'Laurel1')
    peer = create(:laurel_user, sca_name: 'Laurel2')
    candidate = create(:candidate)
    specialty1 = create(:specialty, name: 'Generic Specialty')
    specialty2 = create(:specialty, name: 'Other Specialty')
    sign_in(admin)
    expect(Candidate.last.vote).to eq(false)
    expect(Candidate.last.profile_pic.filename).to eq('frame.jpg')

    visit "/chambers/laurel/admin/candidates/#{candidate.id}/edit" 
    fill_in 'SCA Name', with: 'Smarty Pants'
    select 'Generic Specialty', from: 'Specialties'
    select 'Other Specialty', from: 'Specialties'
    fill_in 'Specialty detail', with: 'Earwax Studies'
    find('#candidate_profile_pic', visible: false).set(image)
    select 'Laurel1', from: 'Advocates'
    select 'Laurel2', from: 'Advocates'
    choose('Vote')
    click_on 'candidate_submit'
    
    expect(Candidate.last.sca_name).to eq('Smarty Pants')
    expect(Candidate.last.specialty_detail).to eq('Earwax Studies')
    expect(Candidate.last.vote).to eq(true)
    advocates = Candidate.last.peers.joins(:user).pluck(:sca_name)
    expect(advocates).to include('Laurel1')
    expect(advocates).to include('Laurel2')
    expect(Candidate.last.profile_pic.filename).not_to eq('frame.jpg')
    specialties = Candidate.last.specialties.pluck(:name)
    expect(specialties).to include('Generic Specialty')
    expect(specialties).to include('Other Specialty')
  end
end
