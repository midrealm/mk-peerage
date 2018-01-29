require 'rails_helper'
RSpec.describe "chambers/peerage/candidates/_gallery.html.erb" do
  context "if no documents submitted" do
    it "shows message that there aren't currently any documents" do
      documents = []
      render partial: "chambers/peerage/candidates/gallery.html.erb", locals: { documents: documents }
      expect(rendered).to have_content "There are currently no documents"
    end
  end
end