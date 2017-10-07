require 'rails_helper'

RSpec.describe Comment, type: :model do
  it {should belong_to(:peer)}
  it {should belong_to(:candidate)}
end
