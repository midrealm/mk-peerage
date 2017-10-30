require 'rails_helper'

RSpec.describe Specialty, type: :model do
  it { should have_many(:specializations) }
  it { should have_many(:peers).through(:specializations) }
  it { should have_many(:candidates).through(:specializations) }
  it { should validate_presence_of(:peerage_type) }
end
