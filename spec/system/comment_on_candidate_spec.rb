require 'rails_helper'
RSpec.describe 'Comment on a Candidate and edit comment' do
  include_context 'when signed in through capybara'

  before(:each) do
    laurel = create(:laurel_user, sca_name: 'Laurel1')
    candidate = create(:candidate)
    sign_in(laurel)
    visit "/chambers/laurel/candidates/#{candidate.id}/" 
    fill_in "comment_text", with: 'Comment Comment Comment'
    click_on 'Create Comment'
  end
  it 'adds comment to a candidate' do
    expect(page).to have_content('Comment Comment Comment')
    expect(page).to have_content('Edit Comment')
  end

  describe 'goes to edit comment page' do
    before(:each) do
      click_on 'Edit Comment'
    end
    it 'clicked edit comment and goes to edit comment page' do
      expect(page).to have_content('Edit Comment for')
      expect(page).to have_content('Comment Comment Comment')
    end

    describe 'edits comment' do
      before(:each) do
        fill_in "comment_text", with: 'New New New'
        click_on 'Update Comment'
      end
      it 'edited comment' do
        expect(page).to have_content('New New New')
        expect(page).to have_content('Edit Comment')
        expect(page).to have_content('Comment updated')
        expect(page).not_to have_content('Comment Comment Comment')
      end
    end

  end
end
