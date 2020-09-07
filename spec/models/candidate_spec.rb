require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it { should validate_presence_of(:peerage_type) }
end
RSpec.describe Candidate, "self.where_order(peerage)" do
  it "returns only Laurel Candidates when :laurel submitted as peerage" do
    create(:laurel_candidate)
    create(:laurel_candidate)
    create(:pelican_candidate)
    candidates = Candidate.where_order(:laurel)
    expect(candidates.count).to eq(2) 
    expect(candidates.first.order).to eq(:laurel)
    expect(candidates.second.order).to eq(:laurel)
  end
  it "returns only Pelicans when :pelican submitted as peerage" do
    create(:pelican_peer)
    create(:pelican_peer)
    create(:laurel_peer)
    candidates = Peer.where_order(:pelican)
    expect(candidates.count).to eq(2) 
    expect(candidates.first.order).to eq(:pelican)
    expect(candidates.second.order).to eq(:pelican)
  end
end
RSpec.describe Candidate, "specialties_link" do
  it "handles two specialties" do
    spec1 = create(:specialty, name: 'Spec', slug: 'spec')
    spec2 = create(:specialty, name: 'Spec 2', slug: 'spec_2')
    candidate = create(:laurel_candidate)
    create(:specialization, candidate: candidate, specialty: spec1)
    create(:specialization, candidate: candidate, specialty: spec2)
    expect(candidate.specialties_link).to eq('<a href="/chambers/laurel/specialties/spec">Spec</a>, <a href="/chambers/laurel/specialties/spec_2">Spec 2</a>')
  end

end
RSpec.describe Candidate, "advocates_link" do
  it "handles two advocates" do
    candidate = create(:laurel_candidate)
    sup1 = create(:laurel_user, sca_name: 'Laurel 1', slug: 'laurel_1')
    sup2 = create(:laurel_user, sca_name: 'Laurel 2', slug: 'laurel_2')
    create(:advocacy, candidate: candidate, peer: sup1.laurel)
    create(:advocacy, candidate: candidate, peer: sup2.laurel)

    expect(candidate.advocates_link).to eq('<a href="/laurel/laurel_1">Laurel 1</a>, <a href="/laurel/laurel_2">Laurel 2</a>')
  end
end
RSpec.describe Candidate, "order" do
  it "returns :laurel for a Laurel Peer" do
    candidate = build(:candidate, peerage_type: :laurel)
    expect(candidate.order).to eq(:laurel) 
  end
  it "returns :pelican for a Pelican Peer" do
    candidate = build(:candidate, peerage_type: :pelican)
    expect(candidate.order).to eq(:pelican) 
  end
end
RSpec.describe Candidate, "enforce_parent_specialty" do
  before :each do
    @parent = create(:specialty, name: 'Parent')
    @child = create(:specialty, name: 'Child', parent_id: @parent.id)
    @candidate = create(:laurel_candidate)
  end
  it "sets parent specialty if child specialty selected and parent specializaiton doesn't already exit" do
    @candidate.update(:specialty_ids => [@child.id])
    expect(@candidate.specialties.count).to eq(2)
  end
  it "only sets one parent specialization even if two new children created" do
    child2 = create(:specialty, name: 'Child2', parent_id: @parent.id) 
    @candidate.update( :specialty_ids => [@child.id, child2.id])
    expect(@candidate.specialties.count).to eq(3)
  end
  it "sets only one parent if child and parent selected" do
    @candidate.update(:specialty_ids => [@child.id, @parent.id])
    expect(@candidate.specialties.count).to eq(2)
  end
end
