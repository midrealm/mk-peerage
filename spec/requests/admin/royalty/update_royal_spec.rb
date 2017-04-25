require "rails_helper"
describe "put /chambers/admin/royalty/:id" do
  it "edits royalty status for given laurel, redirects to royalty manage page" do
    laurel = create(:user, sca_name: 'Mundungus Jones', role: 'admin')
    royal = create(:user, sca_name: 'New Royal', royalty: false)
    sign_in(laurel)

    expect(User.last.sca_name).to eq('New Royal')
    expect(User.last.royalty).to be_falsy
    put "/chambers/admin/royalty/#{royal.id}", params: { :royal => {royalty: true} }
    expect(response).to redirect_to '/chambers/admin/royalty'
    expect(User.last.royalty).to be_truthy
  end
  it "redirects if not logged in" do
    royal = create(:user, sca_name: 'New Royal')
    put "/chambers/admin/royalty/#{royal.id}", params: { :laurel => {deceased: true} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
