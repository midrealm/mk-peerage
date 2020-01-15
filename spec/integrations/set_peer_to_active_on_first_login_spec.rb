require 'rails_helper'
RSpec.feature 'set_peer_to_active_on_first_login' do
  include_context 'when signed in through capybara'

  background do
    user = create(:laurel_pelican_user, sca_name: 'Laurel1')
    user.laurel.update(active: false)
    user.pelican.update(active: false)
    sign_in(user)
  end
  scenario 'active set to true on first login' do
    expect(User.first.laurel.active).to be_truthy
    expect(User.first.pelican.active).to be_truthy
  end

  feature 'setting active to false sets active to false' do
    background do
      visit '/users/edit'
      uncheck 'user_laurel_attributes_active'
      uncheck 'user_pelican_attributes_active'
      click_on 'user_submit'
    end
    scenario 'laurel and pelican set manually to inactive' do
      expect(User.first.laurel.active).to be_falsey
      expect(User.first.pelican.active).to be_falsey
    end
    feature 'signing in a second time does not set active status' do
      background do
        click_on  'dashboard-logout'
        sign_in(User.first)  
      end
      scenario 'laurel and pelican still inactive' do
        expect(User.first.laurel.active).to be_falsey
        expect(User.first.pelican.active).to be_falsey
      end
    end
  end
end
