require "rails_helper"
describe "get /users/set_up_account" do
  it "shows page for setting up account" do
    get "/users/set_up_account"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Set Up Your Peerage Account')
  end
end

describe "post /users/set_up_account" do
  it "redirects to home and sends email for found account" do
    laurel = create(:laurel_user, sca_name: 'Lucy Laurel', email: 'thing@example.com')
    post "/users/set_up_account", params: { :user => { sca_name: 'Lucy Laurel', email: 'thing@example.com' } }
    expect(response).to redirect_to "/"
  end
end

