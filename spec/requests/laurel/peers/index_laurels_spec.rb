require "rails_helper"
describe "Get /laurel/roll_of_honor" do
  it "shows list of laurels" do
    get "/laurel/roll_of_honor"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Roll of Honor')
  end
  it 'only shows laurels (not royalty)' do
    create(:user, sca_name: 'Mistress Mindy')
    create(:royal, sca_name: 'Duke Ducky')
    get '/laurel/roll_of_honor'
    expect(response.body).to include('Mistress Mindy')
    expect(response.body).not_to include('Duke Ducky')
  end
end
