require "rails_helper"
describe "Get /chambers/pelican/admin/pelicans/:id/edit" do
  context "for logged in pelican admin" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
    end
    it "shows edit page for pelican" do
      new_pelican = create(:pelican, sca_name: 'Dingus McDOOOGLE')
      get "/chambers/pelican/admin/pelicans/#{new_pelican.id}/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Pelican Dingus McDOOOGLE')
    end
    it "raises Access Denied when editing non-pelican user" do
      laurel = create(:user)
      expect{get "/chambers/pelican/admin/pelicans/#{laurel.id}/edit"}.to raise_error("Access Denied")

    end
  end
  it "redirects if not logged in" do
    pelican = create(:pelican, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/pelican/admin/pelicans/#{pelican.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
