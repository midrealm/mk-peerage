require 'rails_helper'
describe ApplicationHelper do
  describe "flash_class(level)" do
    it "spits out 'alert alert-info' for 'notice'" do
      expect(helper.flash_class('notice')).to eq('alert alert-info')
    end
    it "spits out 'alert alert-success' for 'success'" do
      expect(helper.flash_class('success')).to eq('alert alert-success')
    end
    it "spits out 'alert alert-error' for 'error'" do
      expect(helper.flash_class('error')).to eq('alert alert-danger')
    end
    it "spits out 'alert alert-error' for 'alert'" do
      expect(helper.flash_class('alert')).to eq('alert alert-danger')
    end
    it "spits out 'alert alert-error' for 'danger'" do
      expect(helper.flash_class('danger')).to eq('alert alert-danger')
    end
  end

  describe "collection_link(collection:, name:, path:)" do
    it "handles one item in collection" do
      spec1 = create(:specialty, name: 'Spec', slug: 'spec')
      peer = create(:laurel_peer)
      create(:specialization, peer: peer, specialty: spec1)
      
      expect(helper.collection_link(collection: peer.specialties, label: 'name', order: peer.order, url_helper: 'specialty_path')).to eq('<a href="/laurel/specialties/spec">Spec</a>')
    end
    it "handles multiple items in collection" do
      spec1 = create(:specialty, name: 'Spec', slug: 'spec')
      spec2 = create(:specialty, name: 'Spec 2', slug: 'spec_2')
      peer = create(:laurel_peer)
      create(:specialization, peer: peer, specialty: spec1)
      create(:specialization, peer: peer, specialty: spec2)
      
      expect(helper.collection_link(collection: peer.specialties, label: 'name', order: peer.order, url_helper: 'specialty_path')).to eq('<a href="/laurel/specialties/spec">Spec</a>, <a href="/laurel/specialties/spec_2">Spec 2</a>')
    end
  end
end
