require 'rails_helper'
RSpec.feature 'edit Laurel news page' do
  include_context 'when signed in through capybara'

  background do
    admin = create(:laurel_admin, sca_name: 'Laurel1')
    sign_in(admin)
    visit "/chambers" 
    click_on 'Edit News'
  end
  scenario 'goes to edits news' do
    expect(page).to have_content('Edit Laurel News')
  end

  feature 'edit Laurel news' do
    background do
      fill_in "news_body", with: 'New New New'
      click_on 'Update News'
    end
    scenario 'edited news and clicked update goes back to private chambers' do
      expect(page).to have_content('Admin Tasks' )
      expect(page).to have_content('New New New')
    end

  end
end
