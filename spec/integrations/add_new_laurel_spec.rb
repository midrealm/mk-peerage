require 'rails_helper'

RSpec.feature 'Add New Laurel' do
  include_context 'when signed in through capybara'
  scenario 'adds new candidate when appropriate info is filled in' do
    admin = create(:admin)
    expect(User.count).to eq(1)
    sign_in(admin)
    visit '/chambers/admin/laurels/new' 
    fill_in 'laurel_sca_name', with: 'Smarty Pants'
    fill_in 'laurel_email', with: 'fake@elkiss.com'
    click_on 'Create Laurel'
    
    expect(User.count).to eq(2)
    expect(User.last.sca_name).to eq('Smarty Pants')
    expect(User.last.email).to eq('fake@elkiss.com')
    expect(User.last.vigilant).to eq(true)
    expect(User.last.active).to eq(true)
    expect(User.last.laurel).to eq(true)
  end
end
