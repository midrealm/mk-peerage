require 'rails_helper'
describe CandidatePresenter do
  before(:each) do
    @laurel = create(:laurel_peer)
    @group = create(:group)
    @candidate = create(:laurel_candidate, group: @group)
    @comment = create(:comment, candidate: @candidate, peer: @laurel) 
    @document = create(:document, candidate: @candidate, peer: @laurel)
  end
  subject do
    described_class.new(candidate: @candidate)
  end
  context "#initialize" do
    it "shows candidate id" do
      expect(subject.id).to eq(@candidate.id)
    end
    it "shows peerage_type" do
      expect(subject.peerage_type).to eq(@candidate.peerage_type)
    end
    it "shows sca_name" do
      expect(subject.sca_name).to eq(@candidate.sca_name)
    end
    it "shows profile_pic" do
      expect(subject.profile_pic).to eq(@candidate.profile_pic)
    end
    it "shows what list candidate is on" do
      expect(subject.list).to eq(@candidate.list)
    end
    it "shows comments" do
      expect(subject.comments.first).to eq(@comment)
    end
    it "shows group" do
      expect(subject.group).to eq(@group)
    end
    it "shows document" do
     expect(subject.documents&.first).to eq(@document)
    end
  end
  context "#poll_result?" do
    it 'returns true when there is a last published poll result' do
      poll = create(:past_published_poll)
      create(:poll_result, candidate: @candidate, poll: poll)
      expect(subject.poll_result?).to be_truthy 
    end
    it 'returns false when there is no last poll result' do
      expect(subject.poll_result?).to be_falsey 
    end
  end
  context "#documents" do
    it "returns non-nil documents" do
      expect(subject.documents.count).to eq(1)
    end
    it "does not return nil documents" do
      @document.document.purge
      expect(subject.documents.count).to eq(0)
    end
  end
  context "#documents?" do
    it "returns non-nil documents" do
      expect(subject.documents?).to eq(true)
    end
    it "does not return nil documents" do
      @document.document.purge
      expect(subject.documents?).to eq(false)
    end
  end
  context "document_count" do
    it 'returns count of documents' do
      expect(subject.document_count).to eq(1) 
    end 
    it 'returns 0 for no documents' do
      @document.document.purge
      expect(subject.document_count).to eq(0) 
    end
  end
  context "specialties" do
    before(:each) do
      specialty = create(:specialty, name: 'Music')
      create(:specialization, candidate: @candidate, specialty: specialty)
    end
    context "#specialites" do
      it "outputs string of specialties with appropriate linking" do
        @candidate.update(specialty_detail: 'Motets')
        expect(subject.specialties).to eq('<a href="/chambers/laurel/specialties/music">Music</a>, Motets')
      end  
      it "outputs no specialty_detail appropriately" do
        expect(subject.specialties).to eq('<a href="/chambers/laurel/specialties/music">Music</a>')
      end
    end
    context "#specialities?" do
      it 'returns true for exisitng specialties' do
        @candidate.update(specialty_detail: 'Motets')
        expect(subject.specialties?).to be_truthy
      end
      it 'returns true for one specialty and no detail' do
        expect(subject.specialties?).to be_truthy
      end
      it 'returns true for specialty detail and no Specialty' do
        @candidate.update(specialty_detail: 'Motets')
        Specialization.last.destroy
        expect(subject.specialties?).to be_truthy
      end
      it 'returns false for no specialty detail or Specialty'  do
        Specialization.last.destroy
        expect(subject.specialties?).to be_falsey
      end 
    end
  end
  context "advocates" do
    before(:each) do
      @laurel = create(:laurel_peer)
      create(:advocacy, candidate: @candidate, peer: @laurel)
    end
    context "#advocates" do
      it "returns advocate as a link"  do
        expect(subject.advocates).to eq("<a href=\"/laurel/#{@laurel.slug}\">#{@laurel.sca_name}</a>")  
      end
      it "returns advocates as links separated by ', '" do
        laurel2 = create(:laurel_user, sca_name: 'Bob', slug: 'bob')
        create(:advocacy, candidate: @candidate, peer: laurel2.laurel)
        expect(subject.advocates).to eq("<a href=\"/laurel/#{@laurel.slug}\">#{@laurel.sca_name}</a>, <a href=\"/laurel/bob\">Bob</a>")  
      end
    end
    context "#advocates?" do
      it "returns true if there are advocates" do
        expect(subject.advocates?).to be_truthy 
      end
      it "returns false if there are no advocates" do
        Advocacy.last.destroy
        expect(subject.advocates?).to be_falsey 
      end
    end
  end
  context "last published poll results" do
    before(:each) do
      @poll = create(:past_published_poll) 
      @poll_result = create(:poll_result, candidate: @candidate, poll: @poll, elevate: 1, wait:2, drop:3, no_strong_opinion: 4, rec: 0.399999, fav: 0.59999)
    end
    it "shows elevate" do
      expect(subject.elevate).to eq(@poll_result.elevate)
    end
    it "shows wait" do
      expect(subject.wait).to eq(@poll_result.wait)
    end
    it "drop" do
      expect(subject.drop).to eq(@poll_result.drop)
    end
    it "shows no_strong_opinion" do
      expect(subject.no_strong_opinion).to eq(@poll_result.no_strong_opinion)
    end
    it "rec" do
      expect(subject.rec).to eq("40%")
    end
    it "fav" do
      expect(subject.fav).to eq("60%")
    end
  end
  context "last published poll results for no polls" do
    it "shows elevate" do
      expect(subject.elevate).to eq('')
    end
    it "shows wait" do
      expect(subject.wait).to eq('')
    end
    it "drop" do
      expect(subject.drop).to eq('')
    end
    it "shows no_strong_opinion" do
      expect(subject.no_strong_opinion).to eq('')
    end
    it "rec" do
      expect(subject.rec).to eq('')
    end
    it "fav" do
      expect(subject.fav).to eq('')
    end
  end
end
