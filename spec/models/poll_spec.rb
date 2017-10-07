require 'rails_helper'

RSpec.describe Poll, type: :model do
  it {should have_many(:advisings)}
  it {should have_many(:candidates).through(:advisings)}
  it {should have_many(:peers).through(:advisings)}

  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }

  it 'does not accept end_dates after start_dates' do
    poll = build(:poll, start_date: DateTime.now + 2.days, end_date: DateTime.now + 1.days)
    expect(poll.valid?).to be_falsey
  end

  it 'does not accept start_dates in the past' do
    poll = build(:poll, start_date: DateTime.now - 3.day, end_date: DateTime.now + 1.day)
    expect(poll.valid?).to be_falsey
  end

end
