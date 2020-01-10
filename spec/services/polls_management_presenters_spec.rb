require 'rails_helper'
describe PollsManagementPresenter, 'future?' do
  before(:each) do
    create(:past_poll)
    create(:current_poll)
  end
  it "returns true if future poll exists" do
    create(:future_poll)
    presenter = PollsManagementPresenter.new(Poll.all)
    expect(presenter.future?).to be_truthy
  end 
  it "returns false only past and active polls exit" do
    presenter = PollsManagementPresenter.new(Poll.all) 
    expect(presenter.future?).to be_falsey
  end
end
describe PollsManagementPresenter, 'future' do
  before(:each) do
    create(:past_poll)
    create(:current_poll)
  end
  it "returns future poll" do
    poll = create(:future_poll)
    presenter = PollsManagementPresenter.new(Poll.all)
    expect(presenter.future.id).to eq(poll.id)
  end 
  it "returns false only past and active polls exit" do
    presenter = PollsManagementPresenter.new(Poll.all) 
    expect(presenter.future).to be_nil
  end
end
describe PollsManagementPresenter, 'active?' do
  before(:each) do
    create(:past_poll)
    create(:future_poll)
  end
  it "returns true if future poll exists" do
    create(:current_poll)
    presenter = PollsManagementPresenter.new(Poll.all)
    expect(presenter.active?).to be_truthy
  end 
  it "returns false only past and active polls exit" do
    presenter = PollsManagementPresenter.new(Poll.all) 
    expect(presenter.active?).to be_falsey
  end
end


describe PollsManagementPresenter, 'active' do
  before(:each) do
    create(:past_poll)
    create(:future_poll)
  end
  it "returns active poll" do
    poll = create(:current_poll)
    presenter = PollsManagementPresenter.new(Poll.all)
    expect(presenter.active.id).to eq(poll.id)
  end 
  it "returns false only past and future polls exit" do
    presenter = PollsManagementPresenter.new(Poll.all) 
    expect(presenter.active).to be_nil
  end
end

describe PollsManagementPresenter, 'past' do
  before(:each) do
    create(:current_poll)
    create(:future_poll)
  end
  it "returns array of past polls" do
    poll = create(:past_poll)
    presenter = PollsManagementPresenter.new(Poll.all)
    expect(presenter.past.count).to eq(1)
  end 
  it "returns false only past and future polls exit" do
    presenter = PollsManagementPresenter.new(Poll.all) 
    expect(presenter.past).to be_empty
  end
end
