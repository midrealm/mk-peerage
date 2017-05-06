require 'rails_helper'
describe "Get /chambers/candidates/:id/poll_comments" do
  before(:each) do
    @candidate = create(:candidate)
    @judgement = create(:judgement)
  end
  context 'logged in royal' do
    before(:each) do
      @royal = create(:user, laurel: false, royalty: true)
      sign_in(@royal)
    end
    context 'past poll result' do
      before(:each) do
        @laurel = create(:user)
        @p = build(:poll, start_date: DateTime.now - 2.days, 
          end_date: DateTime.now - 1.day)
        @p.save(validate: false)
        @pr = create(:poll_result, candidate: @candidate, poll: @p, wait: 1)
        @advising = create(:advising, poll: @p, user: @laurel, candidate: @candidate,
          comment: 'I like this candidate, but not ready yet', submitted: true, 
          judgement: @judgement)
      end
      it "shows poll comment page for candidate with poll result" do
        get "/chambers/candidates/#{@candidate.id}/poll_comments"
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Full Poll Results')
        expect(response.body).to include(@candidate.sca_name)
      end
      it "shows comments and judgements from submitted results" do
        get "/chambers/candidates/#{@candidate.id}/poll_comments"
        expect(response.body).to include(@laurel.sca_name)
        expect(response.body).to include(@advising.comment)
        expect(response.body).to include(@advising.judgement.name)
      end
    end
    context 'no past poll result' do
      it "redirects to candidates index" do
        get "/chambers/candidates/#{@candidate.id}/poll_comments"
        expect(response).to redirect_to "/chambers/candidates"
      end
    end
  end
  it "raises AccessDenied Error for non-royal laurel" do
    @laurel = create(:user, laurel: true)
    sign_in(@laurel)
    expect{get "/chambers/candidates/#{@candidate.id}/poll_comments"}.to raise_error(CanCan::AccessDenied)
  end
  it "raises AccessDenied Error for non-royal admin laurel" do
    @laurel = create(:user, laurel: true, role: 'admin')
    sign_in(@laurel)
    expect{get "/chambers/candidates/#{@candidate.id}/poll_comments"}.to raise_error(CanCan::AccessDenied)
  end
  it "redirects if not logged in" do
    get "/chambers/candidates/#{@candidate.id}/poll_comments"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
