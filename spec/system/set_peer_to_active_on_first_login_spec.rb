require 'rails_helper'
RSpec.describe 'set_peer_to_active_on_first_login' do
  include_context 'when signed in through capybara'

  before(:each) do
    user = create(:laurel_pelican_user, sca_name: 'Laurel1')
    user.laurel.update(active: false)
    user.pelican.update(active: false)
    sign_in(user)
  end
  it 'active set to true on first login' do
    expect(User.first.laurel.active).to be_truthy
    expect(User.first.pelican.active).to be_truthy
  end

  describe 'setting active to false sets active to false' do
    before(:each) do
      visit '/users/edit'
      uncheck 'user_laurel_attributes_active'
      uncheck 'user_pelican_attributes_active'
      click_on 'user_submit'
    end
    it 'laurel and pelican set manually to inactive' do
      expect(User.first.laurel.active).to be_falsey
      expect(User.first.pelican.active).to be_falsey
    end
    describe 'signing in a second time does not set active status' do
      before(:each) do
        click_on  'dashboard-logout'
        sign_in(User.first)  
      end
      it 'laurel and pelican still inactive' do
        expect(User.first.laurel.active).to be_falsey
        expect(User.first.pelican.active).to be_falsey
      end
    end
  end
end
