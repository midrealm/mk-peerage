require "rails_helper"
describe "put /chambers/pelican/admin/pelicans/:id" do
  context "for signed in pelican admin" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
    end
    it "update profile for signed in pelican admin, and redirects to profile page" do
      newly_deceased = create(:pelican, sca_name: 'Newly Deceased', deceased: false)

      expect(User.last.sca_name).to eq('Newly Deceased')
      expect(Peer.last.active).to be_truthy
      expect(User.last.deceased).to be_falsy
      put "/chambers/pelican/admin/pelicans/#{newly_deceased.peers.first.id}", params: { :pelican => {deceased: true} }
      expect(response).to redirect_to '/chambers/pelican/admin/pelicans'
      expect(Peer.last.active).to be_falsy
      expect(User.last.deceased).to be_truthy
    end
    it "raises Access Denied when updating of status of non-pelicans" do
      deceased_laurel = create(:user, sca_name: 'Lucy Laurel', deceased: false) 
      expect(User.last.deceased).to be_falsy
      expect{put "/chambers/pelican/admin/pelicans/#{deceased_laurel.peers.first.id}", params: { :pelican => {deceased: true} }}.to raise_error("Access Denied")
      expect(User.last.deceased).to be_falsy
    end
  end
  it "redirects if not logged in" do
    newly_deceased = create(:user, sca_name: 'Newly Deceased', deceased: false)
    put "/chambers/pelican/admin/pelicans/#{newly_deceased.id}", params: { :pelican => {deceased: true} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
