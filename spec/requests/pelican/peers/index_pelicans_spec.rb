require "rails_helper"
describe "Get /pelican/roll_of_honor" do
  it "shows list of pelicans" do
    get "/pelican/roll_of_honor"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Roll of Honor')
  end
  it 'only shows pelicans (not royalty)' do
    create(:pelican, sca_name: 'Mistress Mindy')
    create(:royal, sca_name: 'Duke Ducky')
    get '/pelican/roll_of_honor'
    expect(response.body).to include('Mistress Mindy')
    expect(response.body).not_to include('Duke Ducky')
  end
end
