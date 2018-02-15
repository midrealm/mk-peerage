require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it { should validate_presence_of(:peerage_type) }
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
RSpec.describe Peer, "advocates_link" do
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
