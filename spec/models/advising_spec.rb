require 'rails_helper'

RSpec.describe Advising, type: :model do
  it {should belong_to(:candidate)}
  #it {should belong_to(:user)}
  it {should belong_to(:peer)}
  it {should belong_to(:poll)}
  it {should belong_to(:judgement)}
end

