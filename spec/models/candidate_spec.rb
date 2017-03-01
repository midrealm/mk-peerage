require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it {should have_many(:advocacies)}
  it {should have_many(:users).through(:advocacies)}
end
