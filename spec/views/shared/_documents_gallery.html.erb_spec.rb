require 'rails_helper'
RSpec.describe "chambers/peerage/candidates/_gallery.html.erb" do
  context "document is an image" do
    it "shows an image" do
      c = create(:candidate)
      d = create(:document, name: 'My Document Name', candidate: c, document: FilesTestHelper.jpg )
      render partial: "shared/documents_gallery", locals: { documents: Candidate.first.documents, peerage: :laurel}
      expect(rendered).to have_content "My Document Name"
    end 
  end
  context "document is a pdf" do
    it "shows a pdf" do
      c = create(:candidate)
      d = create(:document, candidate: c, name: 'My Document Name', document: FilesTestHelper.pdf)
      render partial: "/shared/documents_gallery", locals: { documents: Candidate.first.documents, peerage: :laurel }
      expect(rendered).to have_content "My Document Name"
    end 
  end
  context "document is a docx" do
    it "shows a docx" do
      c = create(:candidate)
      d = create(:document, candidate: c, name: 'My Document Name', document: FilesTestHelper.docx)
      render partial: "/shared/documents_gallery", locals: { documents: Candidate.first.documents, peerage: :laurel }
      expect(rendered).to have_content "My Document Name"
    end 
  end
end
