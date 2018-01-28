require "rails_helper"
describe "post /chambers/documents" do
  it "creates new image for candidate" do
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    cand = create(:candidate)
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: cand.id, document: 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7', name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{cand.id}")
  end
end
