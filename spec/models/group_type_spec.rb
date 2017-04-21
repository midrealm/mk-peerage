require 'rails_helper'

RSpec.describe GroupType, type: :model do
  it { should have_many(:groups) }
end
