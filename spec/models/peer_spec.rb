require 'rails_helper'

RSpec.describe Peer, type: :model do
end
RSpec.describe Peer, "specialties_link" do
  it "handles two specialties" do
    spec1 = create(:specialty, name: 'Spec', slug: 'spec')
    spec2 = create(:specialty, name: 'Spec 2', slug: 'spec_2')
    peer = create(:laurel_peer)
    create(:specialization, peer: peer, specialty: spec1)
    create(:specialization, peer: peer, specialty: spec2)
    
    expect(peer.specialties_link).to eq('<a href="/laurel/specialties/spec">Spec</a>, <a href="/laurel/specialties/spec_2">Spec 2</a>')
  end
  it "handles specialty and specialty detail" do
    spec1 = create(:specialty, name: 'Spec', slug: 'spec')
    peer = create(:laurel_peer, specialty_detail: 'Thing')
    create(:specialization, peer: peer, specialty: spec1)
    expect(peer.specialties_link).to eq('<a href="/laurel/specialties/spec">Spec</a>, Thing')
  end
end

RSpec.describe Peer, "superiors_link" do
  it "handles two superiors" do
    peer = create(:laurel_peer)
    sup1 = create(:laurel_user, sca_name: 'Laurel 1', slug: 'laurel_1')
    sup2 = create(:laurel_user, sca_name: 'Laurel 2', slug: 'laurel_2')
    create(:dependency, peer: peer, superior: sup1.laurel)
    create(:dependency, peer: peer, superior: sup2.laurel)

    expect(peer.superiors_link).to eq('<a href="/laurel/laurel_1">Laurel 1</a>, <a href="/laurel/laurel_2">Laurel 2</a>')
  end
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
