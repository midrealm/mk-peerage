require 'rails_helper'
describe CandidatePresenter, 'initialize' do
  before(:each) do
    @laurel = create(:laurel_peer)
    @group = create(:group)
    @candidate = create(:laurel_candidate, group: @group)
    @comment = create(:comment, candidate: @candidate, peer: @laurel) 
    @document = create(:document, candidate: @candidate, peer: @laurel)
    @presenter = CandidatePresenter.new(candidate: @candidate)
  end
  it "shows candidate id" do
    expect(@presenter.id).to eq(@candidate.id)
  end
  it "shows peerage_type" do
    expect(@presenter.peerage_type).to eq(@candidate.peerage_type)
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
describe CandidatePresenter, 'poll_result?' do
  it 'returns true when there is a last published poll result' do
    candidate = create(:candidate)
    poll = create(:past_published_poll)
    create(:poll_result, candidate: candidate, poll: poll)
    presenter = CandidatePresenter.new( candidate: candidate)
    
    expect(presenter.poll_result?).to be_truthy 
  end
  it 'returns false when there is no last poll result' do
    candidate = create(:candidate)
    presenter = CandidatePresenter.new( candidate: candidate)
    
    expect(presenter.poll_result?).to be_falsey 
  end
end
describe CandidatePresenter, 'document_count' do
  before(:each) do
    @candidate = create(:candidate)
  end
  it 'returns count of documents' do
    document = create(:document, candidate:@candidate)
    presenter = CandidatePresenter.new( candidate: @candidate)
    expect(presenter.document_count).to eq(1) 
  end 
  it 'returns 0 for no documents' do
    presenter = CandidatePresenter.new( candidate: @candidate)
    expect(presenter.document_count).to eq(0) 
  end
end
describe CandidatePresenter, 'specialties' do
 
  it "outputs string of specialties with appropriate linking" do
    @candidate = create(:laurel_candidate, specialty_detail: 'Motets')
    @specialty = create(:specialty, name: 'Music')
    create(:specialization, candidate: @candidate, specialty: @specialty)
    @presenter = CandidatePresenter.new( candidate: @candidate)
    expect(@presenter.specialties).to eq('<a href="/chambers/laurel/specialties/music">Music</a>, Motets')
  end  
  it "outputs no specialty_detail appropriately" do
    @candidate = create(:laurel_candidate, specialty_detail: '')
    @specialty = create(:specialty, name: 'Music')
    create(:specialization, candidate: @candidate, specialty: @specialty)
    @presenter = CandidatePresenter.new( candidate: @candidate)
    expect(@presenter.specialties).to eq('<a href="/chambers/laurel/specialties/music">Music</a>')
  end
end
describe CandidatePresenter, 'specialties?' do
    it 'returns true for exisitng specialties' do
      candidate = create(:laurel_candidate, specialty_detail: 'Motets')
      specialty = create(:specialty, name: 'Music')
      create(:specialization, candidate: candidate, specialty: specialty)
      presenter = CandidatePresenter.new( candidate: candidate)
      expect(presenter.specialties?).to be_truthy
    end
    it 'returns true for one specialty and no detail' do
      candidate = create(:laurel_candidate, specialty_detail: nil)
      specialty = create(:specialty, name: 'Music')
      create(:specialization, candidate: candidate, specialty: specialty)
      presenter = CandidatePresenter.new( candidate: candidate)
      expect(presenter.specialties?).to be_truthy
    end
    it 'returns true for specialty detail and no Specialty' do
      candidate = create(:laurel_candidate, specialty_detail: 'Motets')
      presenter = CandidatePresenter.new( candidate: candidate)
      expect(presenter.specialties?).to be_truthy
    end
    it 'returns false for no specialty detail or Specialty'  do
      candidate = create(:laurel_candidate, specialty_detail: nil)
      presenter = CandidatePresenter.new( candidate: candidate)
      expect(presenter.specialties?).to be_falsey
    end 
end

describe CandidatePresenter, 'advocates' do
  before(:each) do
    @candidate = create(:laurel_candidate) 
    @laurel = create(:laurel_peer)
    create(:advocacy, candidate: @candidate, peer: @laurel)
  end
  it "returns advocate as a link"  do
    presenter = CandidatePresenter.new( candidate: @candidate)
    expect(presenter.advocates).to eq("<a href=\"/laurel/#{@laurel.slug}\">#{@laurel.sca_name}</a>")  
  end
  it "returns advocates as links separated by ', '" do
    laurel2 = create(:laurel_user, sca_name: 'Bob', slug: 'bob')
    create(:advocacy, candidate: @candidate, peer: laurel2.laurel)
    presenter = CandidatePresenter.new( candidate: @candidate)
    expect(presenter.advocates).to eq("<a href=\"/laurel/#{@laurel.slug}\">#{@laurel.sca_name}</a>, <a href=\"/laurel/bob\">Bob</a>")  
  end
end
describe CandidatePresenter, 'advocates?' do
  it "returns true if there are advocates" do
    candidate = create(:laurel_candidate) 
    laurel = create(:laurel_peer)
    create(:advocacy, candidate: candidate, peer: laurel)
    presenter = CandidatePresenter.new( candidate: candidate)
   
    expect(presenter.advocates?).to be_truthy 
  end
  it "returns false if there are no advocates" do
    candidate = create(:laurel_candidate) 
    presenter = CandidatePresenter.new( candidate: candidate)
   
    expect(presenter.advocates?).to be_falsey 
  end
end
describe CandidatePresenter, 'last published poll results' do
  before(:each) do
    @candidate = create(:laurel_candidate)     
    @poll = create(:past_published_poll) 
    @poll_result = create(:poll_result, candidate: @candidate, poll: @poll, elevate: 1, wait:2, drop:3, no_strong_opinion: 4, rec: 0.399999, fav: 0.59999)
    @presenter = CandidatePresenter.new( candidate: @candidate)
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
    expect(@presenter.rec).to eq("40%")
  end
  it "fav" do
    expect(@presenter.fav).to eq("60%")
  end
end
describe CandidatePresenter, 'last poll results for no polls' do
  before(:each) do
    @candidate = create(:laurel_candidate)     
    @presenter = CandidatePresenter.new( candidate: @candidate)
  end
  it "shows elevate" do
    expect(@presenter.elevate).to eq('')
  end
  it "shows wait" do
    expect(@presenter.wait).to eq('')
  end
  it "drop" do
    expect(@presenter.drop).to eq('')
  end
  it "shows no_strong_opinion" do
    expect(@presenter.no_strong_opinion).to eq('')
  end
  it "rec" do
    expect(@presenter.rec).to eq('')
  end
  it "fav" do
    expect(@presenter.fav).to eq('')
  end
end
