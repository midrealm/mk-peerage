require 'rails_helper'
RSpec.feature 'Submit Offline Poll' do
  include_context 'when signed in through capybara'
  scenario 'admin submits offline poll' do
    admin = create(:admin)
    laurel = create(:laurel_user, sca_name: 'Elle Example')
    candidate = create(:laurel_candidate, vote: true)
    candidate2 = create(:laurel_candidate, vote: false)
    poll = create(:current_poll)
    sign_in(admin)
    visit '/chambers/laurel/admin/offline_poll_submitter/new'
    select laurel.sca_name, from: "offline_ballot_peer_id"
    select "W", from: "offline_ballot_vote_list_advisings_attributes_0_judgement"
    select "E", from: "offline_ballot_watch_list_advisings_attributes_0_judgement"
    click_on "Submit Ballot"

    expect(page).to have_content('Poll Saved')
    expect(page).to have_content('Manage Laurel Polls')
    advising = Advising.first
    expect(advising.submitted).to be_truthy
    expect(advising.judgement).to eq("wait")
    expect(advising.peer_id).to eq(laurel.laurel.id)
    expect(advising.poll_id).to eq(poll.id)
    expect(advising.candidate_id).to eq(candidate.id)
  end
end

