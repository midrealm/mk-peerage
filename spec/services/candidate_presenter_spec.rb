require 'rails_helper'
require 'candidate_presenter'
describe CandidatePresenter, 'initialize' do
  before(:each) do
    @laurel = create(:laurel_peer)
    @group = create(:group)
    @candidate = create(:laurel_candidate, group: @group)
    @comment = create(:comment, candidate: @candidate, peer: @laurel) 
    @document = create(:document, candidate: @candidate, peer: @laurel)
    @presenter = CandidatePresenter.new(@candidate)
  end
  it "shows sca_name" do
    expect(@presenter.sca_name).to eq(@candidate.sca_name)
  end
  it "shows profile_pic" do
    expect(@presenter.profile_pic).to eq(@candidate.profile_pic)
  end
  it "shows what list candidate is on" do
    expect(@presenter.list).to eq(@candidate.list)
  end
  it "shows comments" do
    expect(@presenter.comments.first).to eq(@comment)
  end
  it "shows group" do
    expect(@presenter.group).to eq(@group)
  end
  it "shows document" do
   expect(@presenter.documents&.first).to eq(@document)
  end
end
describe CandidatePresenter, 'behavior' do
  it "shows advocates" do
    @laurel = create(:laurel_peer)
    @candidate = create(:laurel_candidate)
    create(:advocacy, peer: @laurel, candidate: @candidate)
    @presenter = CandidatePresenter.new(@candidate)
   
    expect(@presenter.advocates).to eq(@candidate.advocacies) 
  end 
 
  it "outputs array of specialties with appropriate linking" do
    @candidate = create(:laurel_candidate, specialty_detail: 'Motets')
    @specialty = create(:specialty, name: 'Music')
    create(:specialization, candidate: @candidate, specialty: @specialty)
    @presenter = CandidatePresenter.new(@candidate)
    expect(@presenter.specialties.count).to eq(2)
    expect(@presenter.specialties.first).to eq('<a href="/chambers/laurel/specialties/music">Music</a>')
    expect(@presenter.specialties.second).to eq('Motets')
  end  
end

describe CandidatePresenter, 'last poll results' do
  before(:each) do
    @candidate = create(:laurel_candidate)     
    @poll = create(:past_poll) 
    @poll_result = create(:poll_result, candidate: @candidate, poll: @poll, elevate: 1, wait:2, drop:3, no_strong_opinion: 4, rec: 0.3, fav: 0.5)
    @presenter = CandidatePresenter.new(@candidate)
  end
  it "shows elevate" do
    expect(@presenter.elevate).to eq(@poll_result.elevate)
  end
  it "shows wait" do
    expect(@presenter.wait).to eq(@poll_result.wait)
  end
  it "drop" do
    expect(@presenter.drop).to eq(@poll_result.drop)
  end
  it "shows no_strong_opinion" do
    expect(@presenter.no_strong_opinion).to eq(@poll_result.no_strong_opinion)
  end
  it "rec" do
    expect(@presenter.rec).to eq("#{@poll_result.rec*100}%")
  end
  it "fav" do
    expect(@presenter.fav).to eq("#{@poll_result.fav*100}%")
  end
end
describe CandidatePresenter, 'last poll results for no polls' do
  before(:each) do
    @candidate = create(:laurel_candidate)     
    @presenter = CandidatePresenter.new(@candidate)
  end
  it "shows elevate" do
    expect(@presenter.elevate).to be_nil
  end
  it "shows wait" do
    expect(@presenter.wait).to be_nil
  end
  it "drop" do
    expect(@presenter.drop).to be_nil
  end
  it "shows no_strong_opinion" do
    expect(@presenter.no_strong_opinion).to be_nil
  end
  it "rec" do
    expect(@presenter.rec).to be_nil
  end
  it "fav" do
    expect(@presenter.fav).to be_nil
  end
end
