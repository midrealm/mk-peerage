require 'rails_helper'
TEST_SUBJECT = 'Test subject'
RSpec.feature 'Contact email' do
  def send_mail(body = nil)
    subject = TEST_SUBJECT
    from = 'bob@example.com'
    from_name = 'Bob Exampleman'
    body ||= 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
    fill_in 'contact_subject', with: subject
    fill_in 'contact_from_name', with: from_name
    fill_in 'contact_from_email', with: from
    fill_in 'contact_message', with: body
    click_on 'Send Message'
  end

  def expect_email_to(expected_whom)
    email = ActionMailer::Base.deliveries.last
    expect(email.to[0]).to eq(expected_whom)
    expect(email.subject).to match(TEST_SUBJECT)
  end

  def setup_pelican_contact
    pelican = create(:pelican_user, sca_name: 'Mundungus Smith')
    visit "/pelican/#{pelican.slug}/contact"
    pelican
  end
  def setup_laurel_contact
    laurel = create(:laurel_user, sca_name: 'Mundungus Smith')
    visit "/laurel/#{laurel.slug}/contact"
    laurel
  end

  scenario 'sends email to pelican' do
    pelican = setup_pelican_contact
    send_mail
    expect_email_to(pelican.email)
  end
  scenario 'sends email to laurel' do
    laurel = setup_laurel_contact
    send_mail
    expect_email_to(laurel.email)
  end

  scenario 'does not send an empty email to pelican' do
    setup_pelican_contact
    expect { send_mail('') }.not_to change(ActionMailer::Base.deliveries, :count)
  end

#  context "with recaptcha enabled" do
#    before(:each) do
#      Recaptcha.configuration.skip_verify_env << "test"
#    end
#
#    scenario 'does not send email without recaptcha' do
#      Recaptcha.configuration.skip_verify_env.delete('test')
#      setup_pelican_contact
#      expect { send_mail }.not_to change(ActionMailer::Base.deliveries, :count)
#    end
#
#    after(:each) do
#      Recaptcha.configuration.skip_verify_env << "test"
#    end
#  end

end
