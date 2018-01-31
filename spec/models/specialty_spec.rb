require 'rails_helper'

RSpec.describe Specialty, type: :model do
  it { should validate_presence_of(:peerage_type) }
  it { should validate_presence_of(:slug) }
end

RSpec.describe Specialty, 'set_slug' do
  it 'should save slug' do
    user = build(:specialty, name: 'Earwax Studies')
    user.save 
    expect(Specialty.last.slug).to eq('earwax_studies')
  end
end
