require "rails_helper"
describe "Get /laurels/LAUREL_NAME/contact" do
  it "shows contact page for given laurel" do
    laurel = create(:user, sca_name: 'Mundungus Smith')
    get "/laurels/mundungus_smith/contact"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Contact Mundungus Smith')
  end
end
