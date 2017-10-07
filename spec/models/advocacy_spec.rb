require 'rails_helper'

RSpec.describe Advocacy, type: :model do
  it {should belong_to(:candidate)}
  it {should belong_to(:peer)}
end
