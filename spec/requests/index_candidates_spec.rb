require "rails_helper"
describe "Get /chambers/candidates" do
  context 'signed in user' do
    before(:each) do
      @laurel = create(:user, sca_name: 'Mundugus Jones')
      sign_in(@laurel)
      @candidate = create(:candidate)
      
    end
    it "shows list of candidates" do
      get "/chambers/candidates"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Candidates')
    end

    it "shows results from last poll in table" do
      p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
      p.save(validate: false)
      pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
      
      get "/chambers/candidates"
      expect(response.body).to include('123456')
    end

    it "does not show comments from last poll" do
      p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
      p.save(validate: false)
      pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
      get "/chambers/candidates"
      expect(response.body).not_to include('Comments from Last Poll')
      expect(response.body).not_to include("candidates/#{@candidate.id}/poll_comments")
    end
  end

  it "for logged in royal, shows comments from last poll" do
      @royal = create(:user, royalty: true, laurel: false)
      sign_in(@royal)
      @candidate = create(:candidate)
      p = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
      p.save(validate: false)
      pr = create(:poll_result, candidate: @candidate, poll: p, wait: 123456)
      get "/chambers/candidates"
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
      get "/chambers/candidates"
      expect(response.body).not_to include('Comments from Last Poll')
      expect(response.body).not_to include("chambers/candidates/#{@candidate.id}/poll_comments")
  end
  it "redirects if not logged in" do
    get "/chambers/candidates"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
