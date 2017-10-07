require 'rails_helper'

RSpec.describe Specialization, type: :model do
  it {should belong_to(:specialty)}
  it {should belong_to(:peer)}
  it {should belong_to(:candidate)}
end
