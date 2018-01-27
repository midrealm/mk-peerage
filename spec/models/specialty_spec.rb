require 'rails_helper'

RSpec.describe Specialty, type: :model do
  it { should validate_presence_of(:peerage_type) }
end
