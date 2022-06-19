require "rails_helper"
describe "post /chambers/documents" do
  before(:each) do
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    @cand = create(:candidate)
  end
  it "creates new document for candidate" do
    document = FilesTestHelper.jpg
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: @cand.id, document: document, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{@cand.id}#documents")
  end
  it "creates new pdf for candidate" do
    document = FilesTestHelper.pdf
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: @cand.id, document: document, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{@cand.id}#documents")
  end
  it "creates new docx for candidate" do
    document = FilesTestHelper.docx
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: @cand.id, document: document, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{@cand.id}#documents")
    follow_redirect!
    expect(response.body).to include("was uploaded successfully")
  end
  it "show error when the document is invalid" do
    post '/chambers/documents', params: { :document => {candidate_id: @cand.id, document: nil, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(0)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{@cand.id}#documents")
    follow_redirect!
    expect(response.body).to include("was not able")
  end
end
