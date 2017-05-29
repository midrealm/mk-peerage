require 'rails_helper'

RSpec.feature 'Add New Laurel' do
  include_context 'when signed in through capybara'
  scenario 'adds new candidate when appropriate info is filled in' do
    admin = create(:user, role: :admin)
    expect(User.count).to eq(1)
    sign_in(admin)
    visit '/admin/users/new' 
    fill_in 'name', with: 'Smarty Pants'
    fill_in 'email', with: 'fake@elkiss.com'
    click_on 'Create User'
    
    expect(User.count).to eq(2)
    expect(User.name).to eq('Smarty Pants')
    expect(User.last.email).to eq('fake@elkiss.com')
  end
end
