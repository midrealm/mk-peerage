require 'rails_helper'
describe "get /chambers/:peerages/admin/offline_poll_submitter/new" do
	context "logged in authorized admin" do
		before(:each) do
			admin = create(:laurel_admin)
			sign_in(admin)
      create(:current_poll)
		end
		it "shows offline poll submitter" do
			get "/chambers/laurel/admin/offline_poll_submitter/new"
			expect(response).to have_http_status(:success)
			expect(response.body).to include("Submit Offline Laurel Poll")
		end
	end
end
