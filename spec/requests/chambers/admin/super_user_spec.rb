require 'rails_helper'
describe "superuser access to chambers" do
  context "for logged in superuser" do
    before(:each) do
      superuser = create(:superuser)
      sign_in(superuser)
    end
    it "can visit chambers royalty admin page" do
      get '/chambers/admin/royalty'
      expect(response).to have_http_status(:success)
    end
    it "can visit laurel peer admin page" do
      get '/chambers/laurel/admin/peers'
    end
    it "can visit pelican peer admin page" do
      get '/chambers/pelican/admin/peers'
    end
  end 
end
