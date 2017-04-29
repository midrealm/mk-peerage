require 'rails_helper'
describe "Get /chambers/poll/candidates/:id/new" do
  before(:each) do
    @candidate = create(:candidate)
  end
  describe "for active poll" do
    before(:each) do
      poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
      poll.save(validate: false)
    end
    describe "for logged in laurel" do
      before(:each) do
        laurel = create(:user, laurel: true)
        sign_in(laurel)
      end
      it "shows candidate poll form" do
        get "/chambers/poll/candidates/#{@candidate.id}"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Poll for #{@candidate.sca_name}")
      end 
    end
  end  
end
