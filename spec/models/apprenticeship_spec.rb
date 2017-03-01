require 'rails_helper'

RSpec.describe Apprenticeship, type: :model do
  it {should belong_to(:laurel)}
  it {should belong_to(:user)}
end
