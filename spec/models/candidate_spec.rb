require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it { should validate_presence_of(:peerage_type) }
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
