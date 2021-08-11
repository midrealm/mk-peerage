require 'rails_helper'
RSpec.describe 'Send Reset Password for Peer' do
  include_context 'when signed in through capybara'
  it 'admin sends reset password email for same peerage peer' do
    admin = create(:admin)
    sign_in(admin)
    Timecop.travel(Time.now + 1.day)
    visit '/chambers/laurel/admin/peers'
    click_on 'Reset Password'

    expect(page).to have_content('Reset Password Instructions Sent')
    email = ActionMailer::Base.deliveries.last
    expect(email.body).to include('Someone has requested a link to change your password') 
    expect(email.body).to include(admin.email)
  end
end

