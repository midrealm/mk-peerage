require 'rails_helper'

RSpec.feature 'Add New Laurel' do
  include_context 'when signed in through capybara'
  scenario 'adds new laurel when appropriate info is filled in' do
    admin = create(:admin)
    expect(User.count).to eq(1)
    sign_in(admin)
    visit '/chambers/laurel/admin/peers/new' 
    fill_in 'laurel_sca_name', with: 'Smarty Pants'
    fill_in 'laurel_email', with: 'fake@elkiss.com'
    click_on 'Create Laurel'
    
    expect(User.count).to eq(2)
    expect(User.last.sca_name).to eq('Smarty Pants')
    expect(User.last.email).to eq('fake@elkiss.com')
    expect(Laurel.last.vigilant).to eq(true)
    expect(Laurel.last.active).to eq(true)
    expect(Peer.last.type).to eq("Laurel")

    email = ActionMailer::Base.deliveries.last
    expect(email.body).to include('Welcome to the Order of the Laurel')
    expect(email.body).to include('https')
  end
end
