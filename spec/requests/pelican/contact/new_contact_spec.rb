require "rails_helper"
describe "Get /pelican/PELICAN_NAME/contact" do
  it "shows contact page for given pelican" do
    pelican = create(:pelican, sca_name: 'Mundungus Smith')
    get "/pelican/mundungus_smith/contact"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Contact Mundungus Smith')
  end
end
