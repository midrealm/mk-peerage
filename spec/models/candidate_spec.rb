require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it {should have_many(:advocacies)}
  it {should have_many(:peers).through(:advocacies)}

  it {should have_many(:comments)}
  it {should have_many(:images)}

  it { should have_many(:specializations) }
  it { should have_many(:specialties).through(:specializations) }

  it { should belong_to(:group) }

  it { should validate_presence_of(:peerage_type) }

end

