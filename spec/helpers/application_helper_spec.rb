require 'rails_helper'
describe ApplicationHelper do
  describe "peer_specialties_link(peer)" do
    it "handles one specialties" do
      spec1 = create(:specialty, name: 'Spec', slug: 'spec')
      peer = create(:laurel_peer)
      create(:specialization, peer: peer, specialty: spec1)
      
      expect(helper.peer_specialties_link(peer)).to eq('<a href="/laurel/specialties/spec">Spec</a>')
    end
    it "handles two specialties" do
      spec1 = create(:specialty, name: 'Spec', slug: 'spec')
      spec2 = create(:specialty, name: 'Spec 2', slug: 'spec_2')
      peer = create(:laurel_peer)
      create(:specialization, peer: peer, specialty: spec1)
      create(:specialization, peer: peer, specialty: spec2)
      
      expect(helper.peer_specialties_link(peer)).to eq('<a href="/laurel/specialties/spec">Spec</a>, <a href="/laurel/specialties/spec_2">Spec 2</a>')
    end
  end
  describe "candidate_specialties_link(candidate)" do
    it "handles one specialties" do
      spec1 = create(:specialty, name: 'Spec', slug: 'spec')
      candidate = create(:laurel_candidate)
      create(:specialization, candidate: candidate, specialty: spec1)
      
      expect(helper.candidate_specialties_link(candidate)).to eq('<a href="/chambers/laurel/specialties/spec">Spec</a>')
    end
    it "handles two specialties" do
      spec1 = create(:specialty, name: 'Spec', slug: 'spec')
      spec2 = create(:specialty, name: 'Spec 2', slug: 'spec_2')
      candidate = create(:laurel_candidate)
      create(:specialization, candidate: candidate, specialty: spec1)
      create(:specialization, candidate: candidate, specialty: spec2)
      
      expect(helper.candidate_specialties_link(candidate)).to eq('<a href="/chambers/laurel/specialties/spec">Spec</a>, <a href="/chambers/laurel/specialties/spec_2">Spec 2</a>')
    end
  end
end
