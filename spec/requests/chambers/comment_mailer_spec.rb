require "rails_helper"
describe "on comment submission" do
  it 'sends an email to laurel list with submitter name' do
    admin = create(:admin)
    admin.laurel.update(specialty_detail: 'Earwax')
    sign_in(admin)
    candidate = create(:candidate, sca_name: 'Dingus McDoogle', specialty_detail: 'Snorfblats')
    post '/chambers/comments', params: {:comment => { candidate_id: candidate.id, text: 'I like this candidate' }}
    
    email = ActionMailer::Base.deliveries.last
    expect(email.to[0]).to eq(ENV['LAUREL_MAILING_LIST'])
    expect(email.subject).to include("Candidate ##{candidate.id} Comment")
    expect(email.body).to include(admin.sca_name)
    expect(email.body).to include('(Earwax)')
    expect(email.body).to include("/laurel/#{admin.slug}")
    expect(email.body).to include('(Snorfblats)')
    expect(email.body).to include('I like this candidate')
    expect(email.body).to include("/chambers/laurel/candidates/#{candidate.id}")
    expect(response).to redirect_to("/chambers/laurel/candidates/#{candidate.id}")
  end
end
