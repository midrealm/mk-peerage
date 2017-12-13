require "rails_helper"
describe "Get /chambers/laurel/admin/laurels/:id/edit" do
  context "for logged in pelican admin" do
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
    end
    it "shows edit page for laurel" do
      admin = create(:admin)
      sign_in(admin)
      new_laurel = create(:user, sca_name: 'Dingus McDOOOGLE')
      get "/chambers/laurel/admin/laurels/#{new_laurel.id}/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Laurel Dingus McDOOOGLE')
    end
    it "raises Access Denied when editing non-laurel user" do
      pelican = create(:pelican)
      expect{get "/chambers/laurel/admin/laurels/#{pelican.id}/edit"}.to raise_error("Access Denied")

    end
  end
  it "redirects if not logged in" do
    laurel = create(:user, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/laurel/admin/laurels/#{laurel.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
