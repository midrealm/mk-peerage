require 'rails_helper'
RSpec.describe "chambers/peerage/admin/candidates/_form.html.erb" do
  context "add new candidate" do
    before(:each) do
      assign(:candidate, build(:laurel_candidate))
      render partial: "chambers/peerage/admin/candidates/form", locals: { peerage: :laurel, url: "/chambers/laurel/admin/candidates"  }
    end
    it "shows Add Candidate Profile Pic" do
      expect(rendered).to match /Add Candidate Profile Pic/
    end
    it "does not show list status" do
      expect(rendered).not_to match /List Status/
    end
  end
  context "edit candidate" do
    before(:each) do
      cand =  create(:laurel_candidate)
      assign(:candidate, cand)
      render partial: "chambers/peerage/admin/candidates/form", locals: { peerage: :laurel, url: "/chambers/laurel/admin/candidates/#{cand.id}" }
    end
    it "shows Add Candidate Profile Pic" do
      expect(rendered).to match /Update Candidate Profile Pic/
    end
    it "does not show list status" do
      expect(rendered).to match /List Status/
    end
  end
end
