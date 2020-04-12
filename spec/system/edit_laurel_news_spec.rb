require 'rails_helper'
RSpec.describe 'edit Laurel news page' do
  include_context 'when signed in through capybara'

  before(:each) do
    admin = create(:laurel_admin, sca_name: 'Laurel1')
    sign_in(admin)
    visit "/chambers" 
    click_on 'Edit News'
  end
  it 'goes to edits news' do
    expect(page).to have_content('Edit Laurel News')
  end

  describe 'edit Laurel news' do
    before(:each) do
      fill_in "news_body", with: 'New New New'
      click_on 'Update News'
    end
    it 'edited news and clicked update goes back to private chambers' do
      expect(page).to have_content('Admin Tasks' )
      expect(page).to have_content('New New New')
    end

  end
end
