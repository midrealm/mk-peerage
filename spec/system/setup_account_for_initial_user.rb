require 'rails_helper'
RSpec.describe 'Setup account for migrated user' do
  it 'user enters correct sca name and email to setup account' do
    laurel = create(:laurel_user, email: 'thing@example.com', sca_name: 'Lucy Laurel')
    visit '/users/set_up_account' 
    fill_in 'sca_name', with: 'Lucy Laurel'
    fill_in 'email', with: 'thing@example.com' 
    click_on 'Send Password Reset Instructions'

    expect(page).to have_content('Account Found. Password Change Email will be sent to thing@example.com shortly')
    email = ActionMailer::Base.deliveries.last
    expect(email.body).to include('Welcome to the Middle Kingdom Peerage Website') 
  end
  it 'user enters incorrect sca name or email to setup account' do
    visit '/users/set_up_account' 
    fill_in 'sca_name', with: 'Lucy Laurel'
    fill_in 'email', with: 'thing@example.com' 
    click_on 'Send Password Reset Instructions'
    expect(page).to have_content('SCA Name and email combination not found. To rectify this, please send an email to Mistress Jadwiga: nique.rio@gmail.com')
  end
end

