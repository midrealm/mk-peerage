require "rails_helper"
describe "put /chambers/laurel/admin/laurels/:id" do
  context "for signed in pelican admin" do
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
    end
    it "edit profile for signed in laurel, and redirects to profile page" do
      newly_deceased = create(:user, sca_name: 'Newly Deceased', deceased: false)

      expect(User.last.sca_name).to eq('Newly Deceased')
      expect(Peer.last.active).to be_truthy
      expect(User.last.deceased).to be_falsy
      put "/chambers/laurel/admin/laurels/#{newly_deceased.peers.first.id}", params: { :laurel => {deceased: true} }
      expect(response).to redirect_to '/chambers/laurel/admin/laurels'
      expect(Peer.last.active).to be_falsy
      expect(User.last.deceased).to be_truthy
    end
    it "raises Access Denied when updating of status of non-laurels" do
      deceased_pelican = create(:pelican, sca_name: 'Peter Pelican', deceased: false) 
      expect(User.last.deceased).to be_falsy
      expect{put "/chambers/laurel/admin/laurels/#{deceased_pelican.peers.first.id}", params: { :laurel => {deceased: true} }}.to raise_error("Access Denied")
      expect(User.last.deceased).to be_falsy
    end
  end
  it "redirects if not logged in" do
    newly_deceased = create(:user, sca_name: 'Newly Deceased', deceased: false)
    put "/chambers/laurel/admin/laurels/#{newly_deceased.peers.first.id}", params: { :laurel => {deceased: true} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
