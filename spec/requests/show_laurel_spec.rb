require "rails_helper"
describe "Get /" do
  it "shows laurel page" do
    laurel = create(:user, sca_name: 'Mundugus Smith')
    get "/laurels/Mundugus_Smith"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Mundugus Smith')
  end
end
