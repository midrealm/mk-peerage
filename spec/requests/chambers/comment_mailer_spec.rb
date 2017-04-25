require "rails_helper"
describe "on comment submission" do
  it 'sends an email to laurel list with submitter name' do
    laurel = create(:user, sca_name: 'Mundugus Jones', role: 'admin')
    candidate = create(:candidate, sca_name: 'Dingus McDoogle')
    sign_in(laurel)
    post '/chambers/comments', params: {:comment => { candidate_id: candidate.id, text: 'I like this candidate' }}
    email = ActionMailer::Base.deliveries.last
    expect(email.to[0]).to eq('laurel@laurelist.org')
    expect(email.subject).to include("Candidate ##{candidate.id} Comment")
    expect(email.body).to include(laurel.sca_name)
    expect(email.body).to include('I like this candidate')
  end
end
