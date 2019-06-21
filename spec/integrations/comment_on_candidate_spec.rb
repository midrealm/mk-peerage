require 'rails_helper'
RSpec.feature 'Comment on a Candidate and edit comment' do
  include_context 'when signed in through capybara'

  background do
    laurel = create(:laurel_user, sca_name: 'Laurel1')
    candidate = create(:candidate)
    sign_in(laurel)
    visit "/chambers/laurel/candidates/#{candidate.id}/" 
    fill_in "comment_text", with: 'Comment Comment Comment'
    click_on 'Create Comment'
  end
  scenario 'adds comment to a candidate' do
    expect(page).to have_content('Comment Comment Comment')
    expect(page).to have_content('Edit Comment')
  end

  feature 'goes to edit comment page' do
    background do
      click_on 'Edit Comment'
    end
    scenario 'clicked edit comment and goes to edit comment page' do
      expect(page).to have_content('Edit Comment for')
      expect(page).to have_content('Comment Comment Comment')
    end

    feature 'edits comment' do
      background do
        fill_in "comment_text", with: 'New New New'
        click_on 'Update Comment'
      end
      scenario 'edited comment' do
        expect(page).to have_content('New New New')
        expect(page).to have_content('Edit Comment')
        expect(page).to have_content('Comment updated')
        expect(page).not_to have_content('Comment Comment Comment')
      end
    end

  end
end
