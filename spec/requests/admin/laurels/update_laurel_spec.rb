require "rails_helper"
describe "put /chambers/admin/laurels/:id" do
  it "edit profile for signed in laurel, and redirects to profile page" do
    admin = create(:admin)
    newly_deceased = create(:user, sca_name: 'Newly Deceased', deceased: false)
    sign_in(admin)

    expect(User.last.sca_name).to eq('Newly Deceased')
    expect(User.last.active).to be_truthy
    expect(User.last.deceased).to be_falsy
    put "/chambers/admin/laurels/#{newly_deceased.id}", params: { :laurel => {deceased: true} }
    expect(response).to redirect_to '/chambers/admin/laurels'
    expect(User.last.active).to be_falsy
    expect(User.last.deceased).to be_truthy
  end
  it "redirects if not logged in" do
    newly_deceased = create(:user, sca_name: 'Newly Deceased', deceased: false)
    put "/chambers/admin/laurels/#{newly_deceased.id}", params: { :laurel => {deceased: true} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
