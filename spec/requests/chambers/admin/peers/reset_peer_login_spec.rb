require 'rails_helper'
describe "get /chambers/peerage/admin/peers/password" do
	context "for logged in laurel admin" do
    before(:each) do
      admin = create("laurel_admin".to_sym)
      sign_in(admin)
    end
		it "has text 'Send Reset Password Email'" do
			get "/chambers/laurel/admin/peers/password"
	    expect(response).to have_http_status(:success)
			expect(response.body).to include('Send Reset Password Email')	
		end
		it "only shows peers of given peerage" do
			laurel = create(:laurel_peer)
			pelican = create(:pelican_user, sca_name: 'Peter Pelican')
			get "/chambers/laurel/admin/peers/password"
			expect(response.body).to include(laurel.sca_name)
			expect(response.body).not_to include(pelican.sca_name)
		end
	end
  it "redirects if not logged in" do
	  get "/chambers/laurel/admin/peers/password"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
	end
  it "rasies AccessDenied Error if user is not an admin" do
    peer = create(:laurel_user)
    sign_in(peer)
    expect{get "/chambers/laurel/admin/peers/password"}.to raise_error(CanCan::AccessDenied)
  end
end
describe "get /chambers/peerage/admin/peers/email" do
	context "for logged in laurel admin" do
    before(:each) do
      admin = create(:laurel_admin)
      sign_in(admin)
    end
		it "has text 'Reset Peer Email and Send Reset Password Email'" do
			get "/chambers/laurel/admin/peers/email"
	    expect(response).to have_http_status(:success)
			expect(response.body).to include('Reset Peer Email and Send Reset Password Email')	
		end
		it "only shows peers of given peerage" do
			laurel = create(:laurel_peer)
			pelican = create(:pelican_user, sca_name: 'Peter Pelican')
			get "/chambers/laurel/admin/peers/email"
			expect(response.body).to include(laurel.sca_name)
			expect(response.body).not_to include(pelican.sca_name)
		end
	end
  it "redirects if not logged in" do
	  get "/chambers/laurel/admin/peers/email"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
	end
  it "rasies AccessDenied Error if user is not an admin" do
    peer = create(:laurel_user)
    sign_in(peer)
    expect{get "/chambers/laurel/admin/peers/email"}.to raise_error(CanCan::AccessDenied)
  end
end
describe "post /chambers/peerage/admin/peers/email" do
  before(:each) do
    admin = create(:laurel_admin)
	  @laurel = create(:laurel_user)
    sign_in(admin)
  end
	it "invalid email address shows error and renders new'" do
		post "/chambers/laurel/admin/peers/email", params: {id: @laurel.id, email: '105920598'}
    expect(response).to have_http_status(:success)
		expect(response.body).to include("Failed to Change Email Address")	
	  expect(response.body).to include('Reset Peer Email and Send Reset Password Email')	
	end
end
