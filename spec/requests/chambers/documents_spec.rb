require "rails_helper"
describe "post /chambers/documents" do
  it "creates new document for candidate" do
    document = fixture_file_upload("#{fixture_path}/images/portrait.jpg", 'image/jpg')
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    cand = create(:candidate)
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: cand.id, document: document, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{cand.id}/documents")
  end
end
describe "get /chambers/:peer/candidates/:candidate_id/documents" do
  it "shows document for a given candidate" do
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    cand = create(:candidate)
    document = create(:document, peer: laurel, candidate: cand)
    get "/chambers/laurel/candidates/#{cand.id}/documents" 
    expect(response).to have_http_status(:success)
    expect(response.body).to include(document.name)
  end
end
