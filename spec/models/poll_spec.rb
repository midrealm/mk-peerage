require 'rails_helper'

RSpec.describe Poll, type: :model do
  it {should have_many(:advisings)}
  it {should have_many(:candidates).through(:advisings)}
  it {should have_many(:users).through(:advisings)}

  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }

  it 'does not accept end_dates after start_dates' do
    poll = build(:poll, start_date: '22-Apr-2017', end_date: '01-Apr-2017')
    expect(poll.valid?).to be_falsey
  end
end
