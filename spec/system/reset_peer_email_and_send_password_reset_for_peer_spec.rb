require 'rails_helper'
RSpec.describe 'Reset Peer Email and Reset Password for Peer' do
  include_context 'when signed in through capybara'
  it 'admin resets peer email and sends reset password email for same peerage peer' do
    admin = create(:admin)
    laurel = create(:laurel_user, email: 'stuff@example.com')
    sign_in(admin)
    Timecop.travel(Time.now + 1.day)
    visit "/chambers/laurel/admin/peers/email?user_id=#{laurel.id}"
    fill_in 'email', with: 'new_stuff@example.com'
    click_on 'Send Reset Password Info to new Email Address'

    expect(page).to have_content("Email Changed for #{laurel.sca_name}")
    expect(page).to have_content('Manage Laurels')
    email = ActionMailer::Base.deliveries.last
    expect(email.body).to include('Someone has requested a link to change your password') 
    expect(email.body).to include('new_stuff@example.com')
  end
end

