require 'rails_helper'

RSpec.describe Dependency, type: :model do
  
  it {should belong_to(:peer)} 
  it {should belong_to(:superior)} 
end
