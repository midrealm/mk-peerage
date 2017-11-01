require "rails_helper"
describe "Get /chambers/admin/laurels/:id/edit" do
  it "shows edit page for laurel" do
    admin = create(:admin)
    sign_in(admin)
    new_laurel = create(:user, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/admin/laurels/#{new_laurel.id}/edit"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Edit Laurel Dingus McDOOOGLE')
  end
  it "redirects if not logged in" do
    laurel = create(:user, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/admin/laurels/#{laurel.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
