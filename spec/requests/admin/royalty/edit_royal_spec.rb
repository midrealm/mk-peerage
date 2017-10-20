require "rails_helper"
describe "Get /chambers/admin/royalty/:id/edit" do
  it "shows edit page for laurel" do
    admin = create(:admin)
    sign_in(admin)
    royal = create(:user, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/admin/royalty/#{royal.id}/edit"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Edit Royalty Status of Dingus McDOOOGLE')
  end
  it "redirects if not logged in" do
    royal = create(:user, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/admin/royalty/#{royal.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
