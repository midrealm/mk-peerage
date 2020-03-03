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
    expect(response).to redirect_to("/chambers/laurel/candidates/#{cand.id}#documents")
  end
  it "creates new pdf for candidate" do
    document = fixture_file_upload("#{fixture_path}/test.pdf", 'application/pdf')
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    cand = create(:candidate)
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: cand.id, document: document, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{cand.id}#documents")
  end
  it "creates new docx for candidate" do
    document = fixture_file_upload("#{fixture_path}/test.docx", 'application/application/vnd.openxmlformats-officedocument.wordprocessingml.document')
    laurel = create(:laurel_peer)
    sign_in(laurel.user)
    cand = create(:candidate)
    expect(Document.count).to eq(0)
    post '/chambers/documents', params: { :document => {candidate_id: cand.id, document: document, name: 'Name', description: 'Description'} }
    expect(Document.count).to eq(1)
    expect(response).to redirect_to("/chambers/laurel/candidates/#{cand.id}#documents")
  end
end
