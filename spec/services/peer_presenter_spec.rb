require 'rails_helper'
describe CandidatePresenter, 'has_ever_logged_in?' do
  before(:each) do
    @peer = create(:laurel_peer)
  end
  it "returns true if peer has ever signed in" do
    @peer.user.update(last_sign_in_at: DateTime.now)
    presenter = PeerPresenter.new(@peer) 
    expect(presenter.has_ever_signed_in?).to be_truthy
  end 
  it "returns false if peer has never signed in" do
    presenter = PeerPresenter.new(@peer) 
    expect(presenter.has_ever_signed_in?).to be_falsey
  end
end
