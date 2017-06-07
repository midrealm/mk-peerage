require 'rails_helper'

RSpec.describe Candidate, type: :model do
  it {should have_many(:advocacies)}
  it {should have_many(:users).through(:advocacies)}

  it {should have_many(:comments)}
  it {should have_many(:images)}

  it { should have_many(:specializations) }
  it { should have_many(:specialties).through(:specializations) }

  it { should belong_to(:group) }

end

RSpec.describe Candidate, 'poll_entry_submitted?' do
  before(:each) do
    @laurel = create(:user, laurel: true)
    @candidate = create(:candidate)
    @judgement = create(:judgement)
  end
  context 'for current poll' do
    before(:each) do
      @current_poll = build(:poll, start_date: DateTime.now - 1.day)
      @current_poll.save(validate: false)
      @advising = build(:advising, candidate: @candidate, 
        poll: @current_poll, user: @laurel, comment: 'Comment', 
        judgement: @judgement, submitted: true)
    end
    it "returns true if user has a submitted advising for given poll" do
      @advising.save
      expect(@candidate.poll_entry_submitted?(@laurel)).to be_truthy
    end

    it "returns false if there is no advising for current poll" do
      expect(@candidate.poll_entry_submitted?(@laurel)).to be_falsey
    end

    it "returns false if there is an advising but it hasn't been submitted" do
      @advising.submitted = false
      @advising.save
      expect(@candidate.poll_entry_submitted?(@laurel)).to be_falsey
    end
  end
  context 'for past poll' do
    it 'returns false' do
      @past_poll = build(:poll, start_date: DateTime.now - 2.day, 
        end_date: DateTime.now - 1.day)
      @past_poll.save(validate: false)
      @advising = create(:advising, candidate: @candidate,
        poll: @past_poll, user: @laurel, comment: 'Comment', 
        judgement: @judgement, submitted: true)

      expect(@candidate.poll_entry_submitted?(@laurel)).to be_falsey
    end
  end

end