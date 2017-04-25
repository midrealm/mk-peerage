require "rails_helper"
describe "Get /laurels" do
  it "shows list of laurels" do
    get "/laurels"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Roll of Honor')
  end
  it 'only shows laurels (not royalty)' do
    create(:user, sca_name: 'Mistress Mindy')
    create(:user, sca_name: 'Duke Ducky', laurel: false, royalty: true)
    get '/laurels'
    expect(response.body).to include('Mistress Mindy')
    expect(response.body).not_to include('Duke Ducky')
  end
end
