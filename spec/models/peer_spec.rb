require 'rails_helper'

RSpec.describe Peer, type: :model do
  it {should belong_to(:user)} 
end
