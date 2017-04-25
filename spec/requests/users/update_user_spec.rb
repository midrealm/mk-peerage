require "rails_helper"
describe "patch /users/edit" do
  it "edits profile for signed in laurel, and redirects to profile page" do
    laurel = create(:user, sca_name: 'Mundungus Jones')
    expect(User.first.sca_name).to eq('Mundungus Jones')
    sign_in(laurel)
    patch "/users/edit", params: { :user => {sca_name: 'Mundingus Janes'} }
    expect(response).to redirect_to '/laurels/mundingus_janes'
    expect(User.first.sca_name).to eq('Mundingus Janes')
  end
  it "redirects if not logged in" do
    get "/users/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
