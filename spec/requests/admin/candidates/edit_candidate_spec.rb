require "rails_helper"
describe "Get /chambers/admin/candidates/:id/edit" do
  it "shows edit page for candidate" do
    admin = create(:admin)
    sign_in(admin)
    candidate = create(:candidate, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/admin/candidates/#{candidate.id}/edit"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Edit Candidate Dingus McDOOOGLE')
  end
  it "redirects if not logged in" do
    candidate = create(:candidate, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/admin/candidates/#{candidate.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
