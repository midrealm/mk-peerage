require "rails_helper"
describe "post /chambers/documents" do
  it "creates new document for candidate" do
    document = FilesTestHelper.jpg
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    cand = create(:candidate)
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: cand.id, document: document, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{cand.id}#documents")
  end
  it "creates new pdf for candidate" do
    document = FilesTestHelper.pdf
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    cand = create(:candidate)
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: cand.id, document: document, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{cand.id}#documents")
  end
  it "creates new docx for candidate" do
    document = FilesTestHelper.docx
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    cand = create(:candidate)
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: cand.id, document: document, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{cand.id}#documents")
  end
end
