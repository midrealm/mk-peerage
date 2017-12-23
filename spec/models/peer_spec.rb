require 'rails_helper'

RSpec.describe Peer, type: :model do
  it {should belong_to(:user)} 
  it {should have_many(:comments)}

  it { should have_many(:specializations) }
  it { should have_many(:specialties).through(:specializations) }

  it { should have_many(:advocacies) }
  it { should have_many(:candidates).through(:advocacies) }

  it { should have_many(:dependencies) }
  it { should have_many(:superiors).through(:dependencies) }
end

RSpec.describe Peer, "order" do
  it "returns :laurel for a Laurel Peer" do
    create(:user)
    expect(Peer.first.order).to eq(:laurel) 
  end
  it "returns :pelican for a Pelican Peer" do
    create(:pelican)
    expect(Peer.first.order).to eq(:pelican) 
  end
end
