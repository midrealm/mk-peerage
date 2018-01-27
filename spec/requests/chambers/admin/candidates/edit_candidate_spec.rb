require 'rails_helper'
describe "Get /chambers/laurel/admin/candidates/:id/edit" do
  before(:each) do
    @candidate = create(:candidate, sca_name: 'Dingus McDOOOGLE', peerage_type: :laurel)
  end
  context "for logged in laurel admin" do
    before(:each) do
      admin = create("laurel_admin".to_sym)
      sign_in(admin)
    end
    it "shows edit page for candidate" do
      get "/chambers/laurel/admin/candidates/#{@candidate.id}/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Candidate Dingus McDOOOGLE')
    end
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/candidates/#{@candidate.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
