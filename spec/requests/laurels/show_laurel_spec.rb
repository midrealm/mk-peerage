require "rails_helper"
describe "Get /laurels/LAUREL_NAME" do
  it "shows laurel page" do
    user = create(:user, sca_name: 'Mundungus Smith')
    get "/laurels/mundungus_smith"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Mundungus Smith')
  end
end
