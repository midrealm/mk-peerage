require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should belong_to(:group_type) }
  it { should have_many(:users) }
  it { should have_many(:candidates) }
end
