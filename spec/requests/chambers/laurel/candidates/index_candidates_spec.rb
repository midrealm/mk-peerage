require "rails_helper"
describe "Get /chambers/laurel/candidates" do
  context 'signed in user' do
    before(:each) do
      @laurel = create(:user)
      sign_in(@laurel)
      @candidate = create(:candidate)
      
    end
    it "shows list of candidates" do
      get "/chambers/laurel/candidates"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Candidates')
    end
    it "only shows laurel candidates" do
      pelican_candidate = create(:candidate, sca_name: 'Penny Pelican', vote: false, peerage_type: :pelican)
      pelican_candidate = create(:candidate, sca_name: 'Peter Pelican', vote: true, peerage_type: :pelican)
      get "/chambers/laurel/candidates"
      expect(response.body).not_to include('Penny Pelican')
      expect(response.body).not_to include('Peter Pelican')
    end
    it "shows advocates for given candidate" do
      advocate = create(:user, sca_name: "Molly Mindingus")
      create(:advocacy, candidate: @candidate, peer: advocate.laurel)
      get "/chambers/laurel/candidates"
      expect(response.body).to include('Molly Mindingus')
    end

    it "shows results from last poll in table" do
      p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
      p.save(validate: false)
      pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
      
      get "/chambers/laurel/candidates"
      expect(response.body).to include('123456')
    end

    it "does not show comments from last poll" do
      p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
      p.save(validate: false)
      pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
      get "/chambers/laurel/candidates"
      expect(response.body).not_to include('Comments from Last Poll')
      expect(response.body).not_to include("candidates/#{@candidate.id}/poll_comments")
    end
  end

  it "for logged in royal, shows comments from last poll" do
      @royal = create(:royal)
      sign_in(@royal)
      @candidate = create(:candidate)
      p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
      p.save(validate: false)
      pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
      get "/chambers/laurel/candidates"
      expect(response.body).to include('Comments from Last Poll')
      expect(response.body).to include("candidates/#{@candidate.id}/poll_comments")
  end

  it "for logged in admin, should not show comments from last poll" do
      @admin = create(:admin)
      sign_in(@admin)
      @candidate = create(:candidate)
      p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
      p.save(validate: false)
      pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
      get "/chambers/laurel/candidates"
      expect(response.body).not_to include('Comments from Last Poll')
      expect(response.body).not_to include("candidates/#{@candidate.id}/poll_comments")
  end
  context "logged in Pelican" do
    before(:each) do
      @pelican = create(:pelican)
      sign_in(@pelican)
    end
    it "shows not authorized error for non-laurel user" do
      expect{get "/chambers/laurel/candidates/"}.to raise_error(CanCan::AccessDenied)
    end 
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/candidates"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
