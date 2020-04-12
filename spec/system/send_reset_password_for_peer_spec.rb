require 'rails_helper'
RSpec.describe 'Send Reset Password for Peer' do
  include_context 'when signed in through capybara'
  it 'admin sends reset password email for same peerage peer' do
    admin = create(:admin)
    laurel = create(:laurel_user)
    sign_in(admin)
    Timecop.travel(Time.now + 1.day)
    visit '/chambers/laurel/admin/peers/password'
    select laurel.sca_name, from: "id"
    click_on 'Send Reset Password Info'

    expect(page).to have_content('Reset Password Instructions Sent')
    expect(page).to have_content('Browse Candidates')
    email = ActionMailer::Base.deliveries.last
    expect(email.body).to include('Someone has requested a link to change your password') 
    expect(email.body).to include(laurel.email)
  end
end

