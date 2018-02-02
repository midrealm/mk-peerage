require "rails_helper"
describe "patch /users/edit" do
  it "edits profile for signed in laurel, and redirects to profile page" do
    laurel = create(:laurel_user, sca_name: 'Mundungus Jones')
    expect(User.first.sca_name).to eq('Mundungus Jones')
    sign_in(laurel)
    patch "/users/edit", params: { :user => {sca_name: 'Mundingus Janes'} }
    expect(response).to redirect_to '/chambers'
    expect(User.first.sca_name).to eq('Mundingus Janes')
  end

  it "updates info for multiple peerages" do
    laurel = create(:laurel_peer)
    pelican = create(:pelican_peer, user: laurel.user)
    sign_in(laurel.user)
    patch "/users/edit", params: { 
        :user => { sca_name: 'Mundingus Janes', 
        :laurel_attributes => {id: laurel.id, elevated_by: 'Person' }, 
        :pelican_attributes => {id: pelican.id, elevated_by: 'Other Person' } } 
        }
    expect(Laurel.last.elevated_by).to eq('Person') 
    expect(Pelican.last.elevated_by).to eq('Other Person') 
  end
  it "redirects if not logged in" do
    get "/users/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
