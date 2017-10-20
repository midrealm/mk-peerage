require 'rails_helper'

RSpec.describe Peer, type: :model do
  it {should belong_to(:user)} 

  it { should have_many(:specializations) }
  it { should have_many(:specialties).through(:specializations) }
end
