require "rails_helper"
describe "Get /laurels" do
  it "shows list of laurels" do
    get "/laurels"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Roll of Honor')
  end
end
