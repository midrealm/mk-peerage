require "rails_helper"
describe "Get /pelicans/PELICAN_NAME" do
  it "shows pelican page" do
    user = create(:pelican, sca_name: 'Mundungus Smith')
    get "/pelican/mundungus_smith"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Mundungus Smith')
  end
end
