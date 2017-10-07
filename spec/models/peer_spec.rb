require 'rails_helper'

RSpec.describe Peer, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:advocacies) }
  it { should have_many(:candidates).through(:advocacies) }
  it { should have_many(:specializations) }

  it { should have_many(:specialties).through(:specializations) }
  it { should have_many(:comments) }
end
