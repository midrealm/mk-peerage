require 'rails_helper'

RSpec.describe Specialty, type: :model do
  it { should have_many(:specializations) }
  it { should have_many(:users).through(:specializations) }
  it { should have_many(:peers).through(:specializations) }
  it { should have_many(:candidates).through(:specializations) }
end
