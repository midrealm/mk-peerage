require 'rails_helper'

RSpec.describe Peer, type: :model do
end

RSpec.describe Peer, "potential_superiors" do
  before(:each) do
    @laurel1 = create(:laurel_user)
    @laurel2 = create(:laurel_user, sca_name: 'Lucy Laurel')
    @pelican = create(:pelican_user)
  end
  it "returns only peers of the same peerage as given peerage" do
    expect(@laurel1.laurel.potential_superiors).to include(@laurel2.laurel)
    expect(@laurel1.laurel.potential_superiors).not_to include(@pelican.pelican)
  end  
  it "does not include self in collection" do
    expect(@laurel1.laurel.potential_superiors).not_to include(@laurel1.laurel)
  end
end

RSpec.describe Peer, "order" do
  it "returns :laurel for a Laurel Peer" do
    peer = build(:laurel_peer)
    expect(peer.order).to eq(:laurel) 
  end
  it "returns :pelican for a Pelican Peer" do
    peer = build(:pelican_peer)
    expect(peer.order).to eq(:pelican) 
  end
end


RSpec.describe Peer, "self.where_order(peerage)" do
  it "returns only Laurels when :laurel submitted as peerage" do
    create(:laurel_peer)
    create(:laurel_peer)
    create(:pelican_peer)
    peers = Peer.where_order(:laurel)
    expect(peers.count).to eq(2) 
    expect(peers.first.order).to eq(:laurel)
    expect(peers.second.order).to eq(:laurel)
  end
  it "returns only Pelicans when :pelican submitted as peerage" do
    create(:pelican_peer)
    create(:pelican_peer)
    create(:laurel_peer)
    peers = Peer.where_order(:pelican)
    expect(peers.count).to eq(2) 
    expect(peers.first.order).to eq(:pelican)
    expect(peers.second.order).to eq(:pelican)
  end
end

RSpec.describe Peer, "self.orders" do
  it "returns array of all the orders" do
    expect(Peer.orders).to contain_exactly(:laurel, :pelican)
  end 
end

RSpec.describe Peer, "self.subclass(:peerage)" do
  it "returns subclass" do
    expect(Peer.subclass(:laurel)).to eq(Laurel)
  end 
end
